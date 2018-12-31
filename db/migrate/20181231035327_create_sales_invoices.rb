class CreateSalesInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_invoices do |t|
      t.integer :bill_number
      t.references :customer, foreign_key: true
      t.datetime :date
      t.float :discount
      t.string :payment_type
      t.float :amount

      t.timestamps
    end
    add_index :sales_invoices, :bill_number
  end
end
