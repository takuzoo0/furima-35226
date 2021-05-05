class ProductController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

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

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    move_to_index
  end

  def update
    @product = Product.find(params[:id])
    move_to_index
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :ship_to_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user == @product.user
      redirect_to root_path
    end
  end

end
