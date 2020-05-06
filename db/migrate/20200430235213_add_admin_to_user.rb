class AddAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :boolean, default: false
  end
end