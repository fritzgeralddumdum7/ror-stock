class StatusToVerified < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :status, :is_verified
  end
end
