module RailsLog::LogRecord
  extend ActiveSupport::Concern

  included do
    attribute :path, :string
    attribute :controller_name, :string
    attribute :action_name, :string
    attribute :exception, :string
    attribute :exception_object, :string
    if connection.adapter_name == 'PostgreSQL'
      attribute :exception_backtrace, :string, array: true, default: []
    else
      attribute :exception_backtrace, :string
      serialize :exception_backtrace, Array
    end
    attribute :params, :json, default: {}
    attribute :headers, :json, default: {}
    attribute :cookie, :json, default: {}
    attribute :session, :json, default: {}
    attribute :ip, :string

    default_scope -> { order(id: :desc) }

    after_create_commit :send_message

    delegate :url_helpers, to: 'Rails.application.routes'
  end

  def send_message
    WechatWorkBot.send_message(message_content)
  end

  def message_content
    content = WechatWorkMarkdown.new
    self.as_json(only: [:path, :controller_name, :action_name, :params, :session, :headers, :ip]).each do |k, v|
      content.add_column self.class.human_attribute_name(k), v unless v.blank?
    end
    content.add_column '用户信息', user_info.inspect
    content.add_paragraph(exception)
    content.add_paragraph(exception_backtrace[0])
    content.link_more('详细点击', url_helpers.admin_log_record_url(self))
    content
  end

  def user_info
    token = session.dig('auth_token')
    return {} unless defined? AuthorizedToken
    at = AuthorizedToken.find_by token: token
    if at&.user
      at.user.as_json(only: [:id, :name], methods: [:account_identities])
    elsif at&.account
      at.account.as_json(only: [:id, :identity])
    else
      {}
    end
  end

  def process_job
    LogRecordNotifyJob.perform_later(self)
  end

  class_methods do
    def record_to_log(controller, exp)
      return if Rails.env.development? && RailsLog.config.disable_debug

      request = controller.request
      headers = request.headers

      lc = self.new
      lc.path = request.fullpath
      lc.controller_name = controller.class.name
      lc.action_name = controller.action_name
      lc.ip = request.remote_ip
      lc.params = filter_params(request.filtered_parameters)
      lc.headers = request_headers(headers)
      lc.cookie = headers['rack.request.cookie_hash']
      lc.session = Hash.new(headers['rack.session'])
      lc.exception = [exp.class.name, exp.message].join("\r\n")[0..columns_limit['exception']]
      lc.exception_object = exp.class.to_s
      lc.exception_backtrace = exp.backtrace
      lc.save
    end

    def request_headers(headers)
      result = headers.select { |k, _| k.start_with?('HTTP_') && k != 'HTTP_COOKIE' }
      result = result.collect { |pair| [pair[0].sub(/^HTTP_/, ''), pair[1]] }
      result.sort.to_h
    end

    def filter_params(params)
      params.deep_transform_values(&:to_s).except('controller', 'action')
    end

    def columns_limit
      @columns_limit ||= self.columns_hash.slice(
        'params',
        'headers',
        'cookie',
        'session',
        'exception',
        'exception_object',
        'exception_backtrace'
      ).transform_values { |i| i.limit.nil? ? -1 : i.limit - 1 }
    end

  end
end
