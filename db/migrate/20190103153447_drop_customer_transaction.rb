class DropCustomerTransaction < ActiveRecord::Migration[5.2]
  def change
  	drop_table :customer_transactions
  end
end
