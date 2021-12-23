module Email
  class Admin::SmtpsController < Admin::BaseController
    before_action :set_smtp, only: [:show, :edit, :update, :destroy]

    def index
      q_params = {}
      q_params.merge! default_params

      @smtps = Smtp.default_where(q_params).page(params[:page])
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
        :port
      )
    end

  end
end
