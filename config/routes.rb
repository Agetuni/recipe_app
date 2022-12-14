Rails.application.routes.draw do
  devise_for :users
  root "publics#index"
  
  resources :recipes, only: [:index, :show, :new, :destroy, :create, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  resources :foods, only: [:index, :new, :create, :destroy]
<<<<<<< HEAD
  
  get "/shopping_list", to: "foods#shopping_list"
=======
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
>>>>>>> 2302f074820d64d1601ee40699e9e773f3beb9e0
end
