class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :district
      t.string :state
      t.string :postal_code

      t.timestamps
    end
  end
end
