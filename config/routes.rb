Rails.application.routes.draw do
  get 'cocktails/index'
  get 'cocktails/new'
  get 'cocktails/create'
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create]
end
