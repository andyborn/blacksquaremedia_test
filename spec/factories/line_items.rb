# Read about factories at https://github.com/thoughtbot/factory_girl



FactoryGirl.define do

  # creates order and product dependency factory objects at same time  
  factory :line_item do
    order
    product 
    quantity 1
  end
end
