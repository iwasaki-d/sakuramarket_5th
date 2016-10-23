class SettlementFee < ActiveRecord::Base
  def self.calculate_fee(commodities_total)
    SettlementFee.find_by('settlement_fees.from >= ? AND ? < settlement_fees.to', commodities_total, commodities_total).fee
  end
end
