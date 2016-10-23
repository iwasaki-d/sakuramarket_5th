class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true, null: false
      t.boolean :ordered, null: false, default: false

      t.timestamps null: false
    end
  end
end
