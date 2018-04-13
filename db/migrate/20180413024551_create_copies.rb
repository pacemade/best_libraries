class CreateCopies < ActiveRecord::Migration[5.1]
  def change
    create_table :copies do |t|
      t.integer :copies

      t.timestamps
    end
  end
end
