class Api::RecipesController < ApplicationController

  def index
    if current_user
      @recipes = Recipe.order(:id => :desc)
    else
      @recipes = []
    end

    render 'index.json.jb'

  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    p '*' * 88
    p current_user
    
    @recipe = Recipe.new(
      chef: params[:chef] ,
      title: params[:title],
      ingredients: params[:ingredients],
      prep_time: params[:prep_time],
      directions: params[:directions],
      image_url: params[:image_url],
      user_id: current_user.id 
    )


    @recipe.save
    render 'show.json.jb'
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])

    @recipe.title = params[:title] || @recipe.title 
    @recipe.chef = params[:chef] || @recipe.chef    
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.image_url = params[:image_url] || @recipe.image_url
    @recipe.user_id = @recipe.user_id || 1
    @recipe.save!
    render 'show.json.jb'
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    render json: {message: "You have successfully deleted the recipe"}
  end
end
