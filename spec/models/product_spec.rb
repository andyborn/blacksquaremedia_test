require 'spec_helper'


describe Product do
  
  let(:product){build(:product)}

  it 'instantiates a new valid product' do
    product.should be_valid
  end

  it{ should validate_presence_of(:name)}
  it{ should validate_presence_of(:price)}

  it { should validate_uniqueness_of(:name)}

  it { should validate_numericality_of(:price).only_integer }

end
