class CreateLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :libraries do |t|
      t.string :library_name
      t.string :address
      t.integer :phone_number

      t.timestamps
    end
  end
end
