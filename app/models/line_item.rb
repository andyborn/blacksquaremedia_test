class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  attr_accessible :order_id, :quantity, :product_id

  validates :quantity, numericality: { only_integer: true }
  validates :quantity, numericality: { greater_than: 0}
  validates :order_id, :product_id, presence: true
  validates_associated :product, :order
end
