require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Validation for food model' do
    before(:each) do
      @user = User.create(name: 'Tad', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
      @food = Food.new(name: 'Food', measurement_unit: 'kg', price: '20', user_id: @user.id)
    end

    before { @food.save }

    it 'should not be valid without name' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'should not be valid without measurement_unit' do
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
    end

    it 'should not be valid without price' do
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'should not be valid without user_id' do
      @food.user_id = nil
      expect(@food).to_not be_valid
    end
  end
end
