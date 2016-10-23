class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :cart, index: true, null: false
      t.datetime :order_date, null: false

      t.timestamps null: false
    end
  end
end
