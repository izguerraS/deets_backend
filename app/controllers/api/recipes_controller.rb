class Api::RecipesController < ApplicationController

  def index    
    
    p current_user

    @recipes = Recipe.order(:id => :desc)
    render 'index.json.jb'

  end
end
