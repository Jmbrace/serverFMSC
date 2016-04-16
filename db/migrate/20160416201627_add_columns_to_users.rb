class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about, :string
    add_column :users, :name, :string
  end
end
