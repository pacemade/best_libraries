class ChangePasswordToEncryptedPassword < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :password_digest
    add_column :users, :encrypted_password, :string, null: false, default: ""
  end

  def down
    add_column :users, :password_digest, :string
    remove_column :users, :encrypted_password
  end
end
