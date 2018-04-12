class AddAdminBoolean < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :kind
    add_column :users, :admin, :boolean
  end

  def down
    add_column :users, :kind, :string
    remove_column :users, :admin
  end

end
