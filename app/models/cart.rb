class Cart < ActiveRecord::Base
  include DeliveryDate
  include DeliveryTime
  include Tax
  include ShippingFee

  belongs_to :user
  has_many :cart_commodities, dependent: :destroy
  has_one :order

  validates :user, presence: true
  validates :ordered, inclusion: { in: [true, false] }

  validates :shipping_name, presence: true, on: :update_shipping
  validates :shipping_email, presence: true, on: :update_shipping
  validates :shipping_postal_code, presence: true, on: :update_shipping
  validates :shipping_address, presence: true, on: :update_shipping
  validates :delivery_date, presence: true, on: :update_shipping
  validates :delivery_time, presence: true, on: :update_shipping

  validates :commodities_total, presence: true, numericality: {greater_than: 0}, on: :calculate_cart
  validates :shipping_fee, presence: true, numericality: {greater_than: 0}, on: :calculate_cart
  validates :settlement_fee, presence: true, numericality: {greater_than: 0}, on: :calculate_cart
  validates :tax, presence: true, numericality: {greater_than: 0}, on: :calculate_cart
  validates :pay_total, presence: true, numericality: {greater_than: 0}, on: :calculate_cart

  default_value_for :ordered, false

  def calculate_cart
    self.commodities_total = calculate_cart_commodities
    self.shipping_fee = calculate_shipping_fee(cart_commodities.size)
    self.settlement_fee = SettlementFee.calculate_fee(self.commodities_total)
    self.tax = calculate_tax(self.commodities_total + self.shipping_fee + self.settlement_fee)
    self.pay_total = calculate_pay_total
  end

  def calculate_cart_commodities
    cart_commodities.inject(0) { |sum, cart_commodity|
      sum += cart_commodity.calculate
    }
  end

  def calculate_pay_total()
    self.commodities_total + self.shipping_fee + self.settlement_fee + self.tax
  end

end
