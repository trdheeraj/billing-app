class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.bigint :mobile
      t.string :email
      t.references :address, foreign_key: true
      t.string :tin_number
      t.string :gst_number

      t.timestamps
    end
    add_index :suppliers, :name
    add_index :suppliers, :mobile
    add_index :suppliers, :email
  end
end
