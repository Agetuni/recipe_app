Rails.application.routes.draw do
  devise_for :users
  root "publics#index"
  resources :recipes, only: [:index, :show, :new, :destroy, :create, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end
  get "/shopping_list", to: "foods#shopping_list"
end
