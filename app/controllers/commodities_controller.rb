class CommoditiesController < ApplicationController
  before_action :set_commodity
  before_action :set_cart_commodity

  def show
  end

  private

  def set_commodity
    @commodity = Commodity.find(params[:id])
  end

  def set_cart_commodity
    cart = current_user.active_cart
    @cart_commodity = cart.cart_commodities.find_or_initialize_by(commodity: @commodity)
  end
end
