class Api::RecipesController < ApplicationController

  def index    
    p current_user

    @recipes = Recipe.order(:id => :desc)
    render 'index.json.jb'

  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
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

    @recipe.title = params[:title]
    @recipe.chef = params[:chef]
    @recipe.ingredients = params[:ingredients]
    @recipe.directions = params[:directions]
    @recipe.prep_time = params[:prep_time]
    @recipe.image_url = params[:image_url]
    @recipe.save
    render 'show.json.jb'
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    render json: {message: "You have successfully deleted the recipe"}
  end
end
