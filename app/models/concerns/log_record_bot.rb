class LogRecordBot
  attr_reader :content

  def initialize(log_record)
    @log_record = log_record
    @content = ''
    set_content
  end

  def set_content
    @log_record.as_json(only: [:path, :controller_name, :action_name, :params, :session, :headers, :ip]).each do |k, v|
      add_column @log_record.class.human_attribute_name(k), v unless v.blank?
    end
    add_column '用户信息', @log_record.user_info.inspect
    add_paragraph(@log_record.exception)
    add_paragraph(@log_record.exception_backtrace[0])
    link_more('详细点击', Rails.application.routes.url_for(controller: 'logged/panel/log_records', action: 'show', id: @log_record.id))
  end

  def add_paragraph(content)
    @content << "#{content}\n"
  end

  def add_section(header, paragraph, level: 3)
    @content << "#{'#' * level} #{header}\n"
    @content << "#{paragraph}\n"
  end

  def add_column(title, content)
    @content << "**#{title}：**#{content}\n"
  end

  def link_more(name, url)
    text = "\n[#{name}](#{url})"
    truncate_length = 4096 - text.bytesize

    @content = @content.truncate_bytes(truncate_length) + text
  end

end
