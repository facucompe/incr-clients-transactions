Rails.application.routes.draw do
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :clients, only: [:index] do
      member do
        resources :payments, only: [:index]
        resources :transactions, only: [:index]
      end
    end
  end
end
