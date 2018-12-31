class CreateSupplierTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :supplier_transactions do |t|
      t.references :supplier, foreign_key: true
      t.datetime :date
      t.string :payment_type
      t.float :amount
      t.float :balance_amount
      t.references :purchase_invoice, foreign_key: true

      t.timestamps
    end
  end
end
