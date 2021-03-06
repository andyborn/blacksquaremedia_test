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
    order.destroy.should equal(false)
    order.should have(1).error_on(:base)
  end

  it { should have_many(:line_items) }
  
  describe 'states' do
    describe ':draft' do
      it 'should be the initial state of an order' do
        order.should be_draft
      end
      
      it 'should NOT change "draft" to "placed on :bump when order has no line_items' do
        expect { order.bump }.to raise_error(AASM::InvalidTransition)
      end

      it 'should change "draft" to "placed" on :bump when order has line_item' do
        lineitem = build(:line_item)
        # this method for creating a line item within the order instance needs revising
        order.line_items << lineitem 
        order.bump
        order.should be_placed
      end


    end

    it 'should have four possible states' do
      states_array = order.aasm.states.map(&:name)
      bool = [:draft, :placed, :paid, :cancelled].all?{|state| states_array.include?(state)} && states_array.length == 4
      bool.should equal(true)
    end
  end 

end
