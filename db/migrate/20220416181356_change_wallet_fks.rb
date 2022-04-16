class ChangeWalletFks < ActiveRecord::Migration[6.1]
  def change
    rename_column :wallets, :users_id, :user_id
    rename_column :wallets, :stocks_id, :stock_id
  end
end
