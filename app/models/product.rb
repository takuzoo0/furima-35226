class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture_id
  belongs_to :shipping_charge
  belongs_to :ship_to_day
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 }
  validates :category_id
  validates :condition_id
  validates :shipping_charge_id
  validates :prefecture_id
  validates :ship_to_day
end
