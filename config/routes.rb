Rails.application.routes.draw do

  namespace :email, defaults: { business: 'email' } do
    resources :subscriptions
    namespace :panel, defaults: { namespace: 'panel' } do
      resources :logs, only: [:index, :show, :destroy]
      resources :smtps
    end
    namespace :admin, defaults: { namespace: 'admin' } do
      resources :smtps do
        resources :smtp_accounts
      end
      resources :subscriptions
      resources :templates
    end
  end

end
