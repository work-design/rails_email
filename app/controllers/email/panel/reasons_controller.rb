module Email
  class Panel::ReasonsController < Panel::BaseController
    before_action :set_reason, only: [:show, :edit, :update, :destroy]

    def index
      @reasons = Reason.page(params[:page])
    end

    def new
      @reason = Reason.new
    end

    def create
      @reason = Reason.new(reason_params)

      unless @reason.save
        render :new, locals: { model: @reason }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      @reason.assign_attributes(reason_params)

      unless @reason.save
        render :edit, locals: { model: @reason }, status: :unprocessable_entity
      end
    end

    def destroy
      @reason.destroy
    end

    private
    def set_reason
      @reason = Reason.find(params[:id])
    end

    def reason_params
      params.fetch(:reason, {}).permit(
        :body
      )
    end

  end
end
