class CreateSettelementFees < ActiveRecord::Migration
  def change
    create_table :settelement_fees do |t|
      t.integer :from, null: false
      t.integer :to, null: false
      t.integer :fee, null: false

      t.timestamps null: false
    end
  end
end
