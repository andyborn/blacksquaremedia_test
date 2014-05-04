require 'spec_helper'


describe Product do
  before(:each) do
    @product = FactoryGirl.build(:product)
  end

  it 'instantiates a new valid product' do
    @product.should be_valid
  end

  it 'is invalid without a name' do
    @product.name = ""
    @product.should_not be_valid
  end

  it 'validates uniqueness of name' do
    product = Product.create(name: "AA", price: 22)
    product2 = Product.new(name: "AA", price: 23)
    product2.should_not be_valid
  end

  it 'is invalid without a price'  do 
    @product.price = nil
    @product.should_not be_valid
  end

  it 'is invalid if price not integer' do
    @product.price = 1.5
    @product.should_not be_valid
  end 

end
