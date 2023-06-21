class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :full_name
      t.string :phone_number

      t.timestamps
    end
  end
end
