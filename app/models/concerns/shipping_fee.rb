module ShippingFee
  SHIPPING_FEE = 600.freeze
  ADDITIONAL_SHIPPING_FEE_ITEM_COUNT = 5.freeze

  def calculate_shipping_fee(commodities_count)
    SHIPPING_FEE + (commodities_count / ADDITIONAL_SHIPPING_FEE_ITEM_COUNT) * SHIPPING_FEE
  end

end
