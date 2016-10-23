class Order < ActiveRecord::Base
  belongs_to :cart, dependent: :destroy

  validates :order_date, presence: false
end
