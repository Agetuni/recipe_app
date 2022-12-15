class UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'user'
  def index
    User.all
  end

  def show; end
end
