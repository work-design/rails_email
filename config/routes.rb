Rails.application.routes.draw do

  constraints(RailsLog.config.constraint) do
    resources :log_records
    resources :log_mailers
  end

end
