class BucketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bucket, only: [:show, :add_product, :remove_product]

  def show
    @bucket_items = @bucket.bucket_items.includes(:product)
  end

  def add_product
    product = Product.find(params[:product_id])
    bucket_item = @bucket.bucket_items.find_or_initialize_by(product: product)
    bucket_item.quantity += 1
    if bucket_item.save
      redirect_to bucket_path(@bucket), notice: "#{product.name} was added to your bucket."
    else
      redirect_to products_path, alert: "Could not add product to your bucket."
    end
  end

  def remove_product
    bucket_item = @bucket.bucket_items.find_by(product_id: params[:product_id])
    if bucket_item&.destroy
      redirect_to bucket_path(@bucket), notice: "Product was removed from your bucket."
    else
      redirect_to bucket_path(@bucket), alert: "Could not remove product from your bucket."
    end
  end

  private

  def set_bucket
    @bucket = current_user.bucket
  end
end

