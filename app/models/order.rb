class Order < ActiveRecord::Base

  include AASM

  attr_accessible :vat_rate, :order_date
  validates :vat_rate, :order_date, presence: true

  validate :order_date_cannot_be_in_the_past, on: :create

  has_many :line_items

  after_initialize :set_vat_default 

  aasm do
    state :draft, initial: true
    state :placed
    state :paid
    state :cancelled

    event :bump do
      transitions from: :draft, to: :placed, guard: :has_line_item?
    end
  end

  def has_line_item?
    !self.line_items.empty?
  end

  def set_vat_default
    self.vat_rate ||= Blacksquareapp::Application::VAT 
  end  

  def order_date_cannot_be_in_the_past
    errors.add(:order_date, "can't be in the past") if
      !order_date.blank? and order_date < Date.today
  end 

  def destroy
    errors.add(:base, 'Cannot destroy orders')
    binding.pry
    false
  end
end
