Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :wallets, param: :wallet_name, only: %i[index show] do
    resources :purchases, only: %i[new create]
    resources :buys, only: %i[new create]
    resources :messages, only: %i[index]
  end

  root to: 'kotoba_wallet#home'
end
