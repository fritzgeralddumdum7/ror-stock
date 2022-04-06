class AddQtyInStock < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :qty, :integer, :default => 500
  end
end
