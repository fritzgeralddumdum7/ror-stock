class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :users, index: true, null: false, foreign_key: true
      t.references :stocks, index: true, null: false, foreign_key: true
      t.integer :qty, null: false
      t.float :total_cost, null: false
      t.string :type, null: false
      t.timestamps
    end
  end
end
