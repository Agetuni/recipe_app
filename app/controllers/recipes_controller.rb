class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  load_and_authorize_resource
  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      flash[:success] = 'Recipe deleted successfully'
    else
      flash.now[:danger] = 'Recipe deleted because <ul class="error-list">'
      recipe.errors.full_messages.each do |msg|
        flash[:danger] += "<li>#{msg}</li>"
      end
      flash[:danger] += '</ul>'
    end
    redirect_to recipes_url
  end

  def index
    @recipes = Recipe.all.where(user_id: current_user).order(created_at: :desc)
  end

  def show
    data = Recipe.where(id: params[:id]).with_attached_image
    @recipe = data[0]
    @recipe_foods = Food.all.joins('INNER JOIN recipe_foods ON foods.id = recipe_foods.food_id')
      .order(created_at: :desc).select('foods.*, recipe_foods.quantity, recipe_foods.id as recipe_foods_id')
      .where(recipe_foods: { recipe_id: params[:id] })
    return unless current_user
  end

  def new
    @user = current_user
    @recipe = @user.recipes.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)
    @recipe.preparation_time = "#{params[:recipe][:preparation_time]} minute(s)"
    @recipe.cooking_time = "#{params[:recipe][:cooking_time]} minute(s)"

    respond_to do |format|
      format.html do
        if @recipe.save
          flash[:success] = 'Recipe created successfully'
          redirect_to recipes_url
        else
          flash.now[:danger] = 'Recipe was not created because <ul class="error-list">'
          @recipe.errors.full_messages.each do |msg|
            flash.now[:danger] += "<li>#{msg}</li>"
          end
          flash.now[:danger] += '</ul>'
          render :new
        end
      end
    end
  end

  def sum(recipe_foods)
    total = 0
    recipe_foods.each do |rf_food|
      total += rf_food.food.price * rf_food.quantity.to_i
    end
    total
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public, :description, :image)
  end
end
