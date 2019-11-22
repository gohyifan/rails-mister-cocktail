Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:show, :new, :create]

  root to: 'cocktails#index'

  post 'cocktails/:cocktail_id/doses', to: 'doses#create', as: 'cocktail_doses'
  delete '/doses', to: 'doses#destroy', as: 'delete_doses'
end
