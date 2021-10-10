Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :wallets, only: %i[index show] do
    resources :purchases, only: %i[new create]
    resources :buys, only: %i[new create]
  end

  root to: 'kotoba_wallet#home'
end
