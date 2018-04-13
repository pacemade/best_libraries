class ChangeLibraryPhoneToString < ActiveRecord::Migration[5.1]
  def up
    change_column :libraries, :phone_number, :string
  end

  def down
    change_column :libraries, :phone_number, :integer
  end
end
