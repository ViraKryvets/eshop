require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryBot.build(:product) }
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end

  # context "validations" do
  #   it 'is valid with valid attributes' do
  #     expect(product).to be_valid
  #   end
  
    context "when price <= 0" do
      it "is invalid" do
        product.price = -10
        expect(product).not_to be_valid

        product.price = 0
        expect(product).not_to be_valid
      end
    end
  # end
end

