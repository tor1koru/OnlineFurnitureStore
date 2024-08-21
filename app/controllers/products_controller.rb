class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_product, only: [:show]

  def index
    @products = Product.includes(:category).all
  end

  def show
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: "Product successfully created."
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :image)
  end
end
