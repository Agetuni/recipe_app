Rails.application.routes.draw do
  devise_for :users

  root "public_recipes#index"
 
  resources :recipes, only: [:index, :show, :new, :destroy, :create, :update, :shopping] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
    resources :shopping_lists, only: [:index]
  end
  resources :foods, only: [:index, :new, :create, :destroy]

  resources :public_recipes, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
