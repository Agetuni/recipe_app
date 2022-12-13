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
      if @new_food.save
        flash.now[:success] = 'Food was successfully created.'
      else
        flash.now[:error] = "Error: food could not be saved"
        render :new
      end
    end
  
    def destroy
      @foods = Food.where(user_id: current_user.id).order(created_at: :desc)
      @food_delete = Food.find(params[:id])
      if @food_delete.destroy
        flash.now[:success] = 'Food was successfully deleted.'
      else
        flash.now[:error] = "Error: food could not be deleted"
        render :new
      end  
    end
end