class CreateCartCommodities < ActiveRecord::Migration
  def change
    create_table :cart_commodities do |t|
      t.references :carts, index: true, null: false
      t.references :commodity, index: true, null: false
      t.integer :quantity, null: false

      t.timestamps null: false
    end
  end
end
