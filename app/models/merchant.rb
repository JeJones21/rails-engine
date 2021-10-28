class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  validates_presence_of :name
  
  self.per_page = 20
end
