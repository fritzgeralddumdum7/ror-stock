class WalletUniqueIndexes < ActiveRecord::Migration[6.1]
  def change
    remove_index :wallets, :user_id
    remove_index :wallets, :stock_id
    add_index :wallets, [:user_id, :stock_id], unique: true
  end
end
