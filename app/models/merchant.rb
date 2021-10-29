class Merchant < ApplicationRecord
  has_many :items
  # has_many :invoices

  validates_presence_of :name

  self.per_page = 20

  def self.find_merchant_revenue(merchant_id)
    joins(items: {invoice_items: {invoice: :transactions}})
    .select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .where("transactions.result = ? AND merchants.id = ?", "success", merchant_id)
    .group("merchants.id")
    .first
  end

  #ran out of time while working on this method.
  #need to define route/revenue and action
end
