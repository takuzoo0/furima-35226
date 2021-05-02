class Product < ApplicationRecord
  belongs_to :user
  has_one :buyer

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :ship_to_day_id
    validates :price
  end
end
