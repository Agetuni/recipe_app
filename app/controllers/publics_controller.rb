class PublicsController < ApplicationController
  def index
    @publics = Recipe.where(public: true).order('created_at DESC')
  end
end
