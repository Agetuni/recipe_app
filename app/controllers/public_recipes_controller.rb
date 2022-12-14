class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.all.where(user_id: current_user).includes(:recipe_foods).where(public: true).order(created_at: :desc)
  end
end
