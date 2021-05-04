class ProductController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :ship_to_day_id, :price).merge(user_id: current_user.id)
  end
end
