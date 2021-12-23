module Email
  class Panel::SmtpsController < Panel::BaseController
    before_action :set_smtp, only: [:show, :edit, :update, :destroy]

    def index
      @smtps = Smtp.page(params[:page])
    end

    def new
      @smtp = Smtp.new
    end

    def create
      @smtp = Smtp.new(smtp_params)

      unless @smtp.save
        render :new, locals: { model: @smtp }, status: :unprocessable_entity
      end
    end

    private
    def set_smtp
      @smtp = Smtp.find(params[:id])
    end

    def smtp_params
      params.fetch(:smtp, {}).permit(
        :name,
        :address,
        :port,
        :authentication,
        :enable_starttls_auto,
        :ssl,
        :openssl_verify_mode
      )
    end

  end
end
