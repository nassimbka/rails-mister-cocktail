class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   if @cocktail.update(cocktail_params)
  #     redirect_to cocktail_path(@cocktail)
  #   else
  #     render :edit
  #   end
  # end

  # can see list INDEX OK
  # can check details of each SHOW OK
  # can create new NEW & CREATE OK

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:ingredients, :doses)
  end

end
