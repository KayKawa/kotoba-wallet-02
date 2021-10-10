Rails.application.routes.draw do
  get 'kotoba_wallet/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'kotoba_wallet#home'
end
