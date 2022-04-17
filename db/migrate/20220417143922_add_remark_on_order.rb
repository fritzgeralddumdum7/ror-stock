class AddRemarkOnOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :remarks, :string, :default => nil
  end
end
