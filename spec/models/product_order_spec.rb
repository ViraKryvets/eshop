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
end

