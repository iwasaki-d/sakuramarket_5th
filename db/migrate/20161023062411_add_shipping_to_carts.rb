class AddShippingToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :shipping_name, :string
    add_column :carts, :shipping_email, :string
    add_column :carts, :shipping_postal_code, :string
    add_column :carts, :shipping_address, :string
    add_column :carts, :delivery_date, :date
    add_column :carts, :delivery_time, :string
  end
end
