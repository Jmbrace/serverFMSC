class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :leftXCrnr
      t.integer :leftYCrnr
      t.string :status
      t.text :message
    end
  end
end
