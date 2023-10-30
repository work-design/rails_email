Rails.application.routes.draw do
  scope RailsCom.default_routes_scope do
    namespace :email, defaults: { business: 'email' } do
      controller :home do
        get :index
        get :preview
      end
      resources :subscriptions
      namespace :panel, defaults: { namespace: 'panel' } do
        root 'home#index'
        resources :logs, only: [:index, :show, :destroy]
        resources :smtps
        resources :reasons
      end
      namespace :admin, defaults: { namespace: 'admin' } do
        resources :smtps do
          resources :smtp_accounts
        end
        resources :logs
        resources :subscriptions
        resources :templates
      end
    end
  end
end
