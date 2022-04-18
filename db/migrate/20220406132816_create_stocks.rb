class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :code
      t.float :unit_price
      t.timestamps
    end
  end
end
