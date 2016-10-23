class CreateCommodities < ActiveRecord::Migration
  def change
    create_table :commodities do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.integer :price, null: false, default: 0
      t.decimal :position, null: false, default: 0
      t.boolean :view_enabled, null: false, default: false

      t.timestamps null: false
    end
  end
end
