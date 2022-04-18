class OrderFks < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :users_id, :user_id
    rename_column :orders, :stocks_id, :stock_id
  end
end
