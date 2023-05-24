require 'rails_helper'

RSpec.describe ProductOrder, type: :model do
  let(:product) { FactoryBot.create(:product) }
  let(:order) { FactoryBot.create(:order) }
  let(:product_order) { FactoryBot.build(:product_order, product: product, order: order) }
  
  describe 'validations' do
    it { should validate_numericality_of(:amount).is_greater_than(0) }
  end

  describe 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:order) }
  end

  context 'validations' do
    # it 'is valid with valid attributes' do
    #   expect(product_order).to be_valid
    # end
    
    it 'is invalid with an amount <= 0' do
      product_order.amount = -10
      expect(product_order).not_to be_valid

      product_order.amount = 0
      expect(product_order).not_to be_valid
    end
  end

  # context 'associations' do
  #   it 'belongs to a product' do
  #     association = described_class.reflect_on_association(:product)
  #     expect(association.macro).to eq :belongs_to
  #   end

  #   it 'belongs to an order' do
  #     association = described_class.reflect_on_association(:order)
  #     expect(association.macro).to eq :belongs_to
  #   end
  # end
  
end

