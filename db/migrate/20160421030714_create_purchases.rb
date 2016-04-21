class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.text :message
      t.string :location

      t.timestamps null: false
    end
  end
end
