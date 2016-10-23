class CartsController < ApplicationController
  before_action :set_cart
  before_action :set_cart_commodities

  def index
  end

  def edit
  end

  def update
    @cart.attributes = cart_params

    unless @cart.valid?(:update_shipping)
      render :edit and return
    end

    @cart.calculate_cart
    unless @cart.valid?(:calculate_cart)
      render :edit, alert: 'カート支払情報の計算に失敗しました' and return
    end

    if @cart.save()
      render :confirm
    else
      render :edit, alert: '決済・配送情報の更新に失敗しました。'
    end
  end

  def update_cart_by_user
    @cart.shipping_name = current_user.name
    @cart.shipping_email = current_user.email
    # @cart.shipping_postal_code = current_user.postal_code
    # @cart.shipping_address = current_user.address

    if @cart.save
      redirect_to :back
    else
      redirect_to :back, alert: 'ユーザー情報からの配送情報入力に失敗しました。'
    end
  end

  def order
    order = @cart.build_order
    order.order_date = DateTime.now

    if order.save()
      @cart.ordered = true
      if @cart.save
        render :appreciation
      else
        order.destroy
      end
    end
  end

  private

  def set_cart_commodities
    @cart_commodities = current_user.active_cart.cart_commodities
  end

  def set_cart
    @cart = current_user.active_cart
  end


  def cart_params
    params.require(:cart).permit(:shipping_name, :shipping_email, :shipping_postal_code, :shipping_address, :delivery_date,
                                 :delivery_time)
  end
end
