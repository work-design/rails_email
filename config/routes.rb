Rails.application.routes.draw do

  scope :admin, as: 'admin', module: 'rails_log' do
    resources :log_records
    resources :log_mailers
  end
  
  controller :rails_log do
    get '/not_founds', action: :index
  end

end

Rails.application.routes.append do
  match '*path' => 'rails_log#not_found', via: :all
end
