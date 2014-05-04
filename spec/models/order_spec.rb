require 'spec_helper'

describe Order do
  before(:each) do
    @order = FactoryGirl.build(:order)
  end

  it 'instantiates a new valid product' do
    @order = Order.new(order_date: "07/07/2014", vat_rate: 0.2)
    @order.should be_valid
  end  

  it 'is invalid without a vat rate'  do 
    @order.vat_rate = nil
    @order.should_not be_valid
  end

  it 'is invalid without a order date' do
    @order.order_date = nil
    @order.should_not be_valid
  end 

  it 'is invalid to create an order date in the past' do
    @order.order_date = "02/02/1999"
    @order.should_not be_valid
  end

  it 'defaults VAT rate to global vat constant in application.rb' do
    order = Order.new
    order.vat_rate.to_f.should equal(Blacksquareapp::Application::VAT)
  end

  it 'can not be deleted' do
    @order.destroy.should raise_error
  end
  
end
