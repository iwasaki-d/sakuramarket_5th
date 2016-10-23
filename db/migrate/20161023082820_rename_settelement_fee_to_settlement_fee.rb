class RenameSettelementFeeToSettlementFee < ActiveRecord::Migration
  def change
    rename_table :settelement_fees, :settlement_fees
  end
end
