class AddPayTotalToCarts < ActiveRecord::Migration
  def change
    def change
      add_column :carts, :commodities_total, :integer, null: false, default: 0
      add_column :carts, :shipping_fee, :integer, null: false, default: 0
      add_column :carts, :settlement_fee, :integer, null: false, default: 0
      add_column :carts, :tax, :integer, null: false, default: 0
      add_column :carts, :pay_total, :integer, null: false, default: 0
    end
  end
end
