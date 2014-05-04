class Product < ActiveRecord::Base
  attr_accessible :name, :price
  validates :name, uniqueness: true
  validates :price, :name, presence: true
  validates :price, numericality: { only_integer: true }

  

end
