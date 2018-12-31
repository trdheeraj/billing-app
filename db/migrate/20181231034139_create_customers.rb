class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.bigint :mobile
      t.string :email
      t.references :address, foreign_key: true

      t.timestamps
    end
    add_index :customers, :name
    add_index :customers, :mobile
    add_index :customers, :email
  end
end
