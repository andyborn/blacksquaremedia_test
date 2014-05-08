require 'spec_helper'

describe Order do

  let(:order) {build(:order)}

  it 'instantiates a new valid product' do
    order.should be_valid
  end  

  it{should validate_presence_of(:vat_rate)}
  it{should validate_presence_of(:order_date)}


  it 'is invalid to create an order date in the past' do
    order.order_date = "02/02/1999"
    order.should_not be_valid
    order.should have(1).error_on(:order_date)
  end

  it 'defaults VAT rate to global vat constant in application.rb' do
    order.vat_rate.to_f.should equal(Blacksquareapp::Application::VAT)
  end

  it 'can not be deleted' do
    order.destroy.should raise_error
  end
  
end
