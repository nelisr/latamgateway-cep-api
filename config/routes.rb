Rails.application.routes.draw do
  # Rotas de exceptions
  # match "/404", :to => "erros#not_found", :via => :all, as: :not_found
  # match "/500", :to => "erros#internal_server_error", :via => :all, as: :server_error

  # Rota principal
  root 'inicio#index'

  # Rotas de endereços
  resources :enderecos do
    collection do
      post 'search', to: 'enderecos#search'
    end
  end
end
