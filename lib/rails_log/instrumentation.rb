module RailsLog
  module Instrumentation

    # 扩展 controller action 的信息
    def process_action(*args)
      raw_payload = {
        :env => request.env
      }

      ActiveSupport::Notifications.instrument("header_processing.action_controller", raw_payload) do
        super
      end
    end

  end
end

ActionController::Base.include RailsLog::Instrumentation
