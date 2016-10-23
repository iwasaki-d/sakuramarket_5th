class CartCommodity < ActiveRecord::Base
  belongs_to :cart
  belongs_to :commodity

  validates :cart, presence: true
  validates :commodity, presence: true
  validates :quantity, numericality: {greater_than: 0}

  default_value_for :quantity, 0

  def calculate
    commodity.price * quantity
  end
end
