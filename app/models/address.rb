class Address < ApplicationRecord
	has_one :customer
	has_one :supplier

	validates :address_1, presence: true
	validates :address_2, presence: true
	validates :district, presence: true
	validates :postal_code, presence: true
end
