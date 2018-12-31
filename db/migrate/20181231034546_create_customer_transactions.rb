class CreateCustomerTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_transactions do |t|
      t.references :customer, foreign_key: true
      t.datetime :date
      t.string :payment_type
      t.float :amount
      t.float :balance_amount
      t.references :sales_invoice, foreign_key: true

      t.timestamps
    end
  end
end
