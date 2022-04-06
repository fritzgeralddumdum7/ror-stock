class UserErdModel < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, :null => false
    add_column :users, :last_name, :string, :null => false
    add_column :users, :is_admin, :boolean, :default => 0
    add_column :users, :status, :boolean, :default => 0
    add_column :users, :available_cash, :float, :default => 60000.00
  end
end
