class CreatePixels < ActiveRecord::Migration
  def change
    create_table :pixels do |t|
      t.integer :x
      t.integer :y
      t.string :status
      t.text :message

      t.timestamps null: false
    end
  end
end
