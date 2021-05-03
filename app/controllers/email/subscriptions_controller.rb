module Email
  class SubscriptionsController < BaseController
    before_action :set_subscription, only: [:show, :edit, :update, :destroy]

    def index
      @subscriptions = Subscription.page(params[:page])
    end

    def new
      login_by_account(params[:auth_token])

      @subscription = Subscription.new
      @subscription.address = params[:address]
    end

    def create
      @subscription = Subscription.new(subscription_params)
      @subscription.unsubscribe_at = Time.current

      unless @subscription.save
        render :new, locals: { model: @subscription }, status: :unprocessable_entity
      end
    end

    def show
    end

    def edit
    end

    def update
      @subscription.assign_attributes(subscription_params)

      unless @subscription.save
        render :edit, locals: { model: @subscription }, status: :unprocessable_entity
      end
    end

    def destroy
      @subscription.destroy
    end

    private
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def subscription_params
      params.fetch(:subscription, {}).permit(
        :address,
        :state,
        :unsubscribe_at
      )
    end

  end
end
