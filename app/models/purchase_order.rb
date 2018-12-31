class PurchaseOrder < ApplicationRecord
  belongs_to :purchase_invoice
  belongs_to :product

  validates :purchase_invoice_id, presence: true
	validates :product_id, presence: true
	validates :quantity, presence: true
end
