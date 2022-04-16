class ChangeTypeField < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :type, :action_type
  end
end
