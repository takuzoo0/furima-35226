class ProductController < ApplicationController
  def index
  end

  private

  def message_params
    params.require(:product).permit(:image, :name, :description, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :ship_to_day_id, :price).merge(user_id: current_user.id)
  end
end
