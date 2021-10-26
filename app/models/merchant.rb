class Merchant < ApplicationRecord

  has_many :items
  has_many :invoices

  self.per_page = 20
end
