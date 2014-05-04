# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    order_date "07/20/2014"
    vat_rate 0.2
  end
end
