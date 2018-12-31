class SalesOrder < ApplicationRecord
  belongs_to :sales_invoice
  belongs_to :product

  validates :sales_invoice_id, presence: true
	validates :product_id, presence: true
	validates :quantity, presence: true
end
