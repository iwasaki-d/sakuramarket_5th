class CartCommoditiesController < ApplicationController
  before_action :set_cart
  before_action :set_commodity

  def create
    cart_commodity = @cart.cart_commodities.build(cart_commodity_params)

    if cart_commodity.save
      redirect_to :back, notice: 'カートに商品を投入しました'
    else
      redirect_to :back, alert: 'カートへの商品投入に失敗しました'
    end
  end

  def update
    cart_commodity = @cart.cart_commodities.find_by(commodity:@commodity)
    cart_commodity.quantity = cart_commodity_params[:quantity]

    if cart_commodity.save
      redirect_to :back, notice: 'カートの投入商品点数を更新しました'
    else
      redirect_to :back, alert: 'カートの投入商品点数の更新に失敗しました'
    end
  end

  private

  def cart_commodity_params
    params.require(:cart_commodity).permit(:commodity_id, :cart_id, :quantity)
  end

  def set_cart
    @cart = current_user.active_cart
  end

  def set_commodity
    @commodity = Commodity.find(cart_commodity_params[:commodity_id])
  end

end
