class CategoriesController < ApplicationController

  def index
    @catgories = Category.all
  end

  def new
    @category = Category.new
  end


  def create 
    @category = Category.new(category_params)
    
    if @category.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )

  end

end
