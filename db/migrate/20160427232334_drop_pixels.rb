class DropPixels < ActiveRecord::Migration
  def change
  	drop_table :pixels
  end
end
