class BuyersController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(product_id: params[:product_id] , user_id: current_user.id, token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user == @product.user || @product.buyer.present?
      redirect_to root_path
    end
  end

end