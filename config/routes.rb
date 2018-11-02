Rails.application.routes.draw do

  scope :admin, module: 'log/admin', as: 'admin' do
    resources :log_records, only: [:index, :show, :destroy]
    resources :log_mailers, only: [:index, :show, :destroy]
    resources :log_csps, only: [:index, :show, :destroy]
  end

  scope module: 'log' do
    controller :rails_log do
      get '/not_founds' => :index
      post '/csp_violation_report' => :csp
    end
  end

end

Rails.application.routes.append do
  match '*path' => 'log/rails_log#not_found', via: :all
end
