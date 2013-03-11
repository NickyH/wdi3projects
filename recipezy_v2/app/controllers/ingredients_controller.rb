class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order(:name)
    @newingredient = Ingredient.new

    respond_to do |format|
      format.html { render :index }
      format.js { render :create }
    end
  end
  def new
    @newingredient = Ingredient.new
  end
  def create
    @newingredient = Ingredient.create(params[:ingredient])
    render :index
  end
  def show
    @ingredient = Ingredient.find(params[:id])
  end
  def edit
    @ingredient = Ingredient.find(params[:id])
  end
  def update
    ingredient = Ingredient.find(params[:id])
    ingredient.update_attributes(params[:recipe])
    redirect_to(ingredient_path)
  end
  def destroy
    ingredient = Ingredient.find(params[:id])
    ingredient.delete
    redirect_to(ingredients_path)
  end

end

