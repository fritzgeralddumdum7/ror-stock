class RemoveStockCode < ActiveRecord::Migration[6.1]
  def change
    remove_column :stocks, :code
  end
end
