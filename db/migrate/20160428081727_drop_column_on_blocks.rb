class DropColumnOnBlocks < ActiveRecord::Migration
  def change
  	remove_column :blocks, :message
  	add_column :blocks, :message, :string
  end
end
