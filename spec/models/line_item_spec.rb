require 'spec_helper'

describe LineItem do
  
  let(:line_item) {build(:line_item)}

  it 'instantiates a new valid line item' do
    line_item.should be_valid
  end

  it{ should validate_numericality_of(:quantity).only_integer}
  it{ should validate_numericality_of(:quantity).is_greater_than(0) }
  
  it { should belong_to(:order) }
  it { should belong_to(:product) }

end
