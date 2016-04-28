class AddStateToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :state, :string
  end
end
