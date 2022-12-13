class FoodsController < ApplicationController
  # TODO: require user to login for all the actions
  before_action :authenticate_user!
  def index
    @foods = Food.all.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    puts 'showing a spacific food'
  end

  def new
    @new_food = Food.new
  end

  def create
    @new_food = Food.new(user: current_user, name: params[:name], price: params[:price],
                         measurement_unit: params[:measurement_unit])
    @new_food.save!
    redirect_to foods_path
  end

  def destroy
    delete_food = Food.find(params[:id])
    RecipeFood.where(food: destroy_food).destroy_all
    delete_food.destroy
    redirect_to foods_path
  end
end
