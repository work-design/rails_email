Rails.application.routes.draw do

  scope :admin, module: 'log/admin', as: 'admin' do
    resources :log_records
    resources :log_mailers
  end

  scope module: 'log' do
    controller :rails_log do
      get '/not_founds', action: :index
    end
  end

end

Rails.application.routes.append do
  match '*path' => 'log/rails_log#not_found', via: :all
end
