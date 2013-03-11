class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order(:title)
    @ingredients = @recipes.each.map(&:key_ingredient).uniq.sort
    preptime = @recipes.each.map(&:preptime)
    cooktime = @recipes.each.map(&:cooktime)
    @time = (preptime + cooktime).uniq.sort

    respond_to do |format|
      format.html { render :index }
      format.js { render :index }
    end
 end
   def new
    @recipe = Recipe.new
  end
  def create
    Recipe.create(params[:recipe])
    @recipes = Recipe.order(:title)
    respond_to do |format|
      format.html { redirect_to(recipes_path) }
      format.js { render :create }
    end
  end
  def show
    @recipe = Recipe.find(params[:id])
    @recipes = Recipe.all
    @tutorials = Tutorial.all
    @ingredients = @recipes.each.map(&:ingredients).first.each.map(&:name)
    @items = @recipe.items.each.map(&:recipe_note)
  end
  def edit
    @recipe = Recipe.find(params[:id])
    @item = Item.new
    respond_to do |format|
      format.html { }
      format.js { render :edit => @recipe }
    end
  end
  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(params[:recipe])
    redirect_to(recipe_path)
  end
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect_to(recipes_path)
  end
   def keyingredient
    @recipes = Recipe.all
    selected = params[:selected]
    found = @recipes.select { |recipe| recipe.key_ingredient == selected }
    render :json => found
  end
end