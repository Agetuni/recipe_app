Rails.application.routes.draw do
  devise_for :users

  root "public_recipes#index"
 
  resources :recipes, only: [:index, :show, :new, :destroy, :create, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :foods, only: [:index, :new, :create, :destroy]

  resources :public_recipes, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  get "/shopping_list", to: "foods#shopping_list"
end
