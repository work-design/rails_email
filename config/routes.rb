Rails.application.routes.draw do

  scope :panel, module: 'logged/panel', as: :panel do
    resources :log_records, only: [:index, :show, :destroy]
    resources :log_mailers, only: [:index, :show, :destroy]
    resources :log_csps, only: [:index, :show, :destroy]
  end

  scope module: 'logged' do
    controller :rails_log do
      get '/not_founds' => :index
      post '/csp_violation_report' => :csp
    end
  end

end
if RailsLog.config.intercept_not_found
  Rails.application.routes.append do
    match '*path' => 'logged/rails_log#not_found', via: :all
  end
end
