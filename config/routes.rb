Rails.application.routes.draw do

  scope :admin, as: 'admin', module: 'rails_log' do
    resources :log_records
    resources :log_mailers
  end

end
