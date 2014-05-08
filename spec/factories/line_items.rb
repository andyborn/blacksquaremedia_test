# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    order_id 1
    product_id 1
    quantity 1
  end
end
