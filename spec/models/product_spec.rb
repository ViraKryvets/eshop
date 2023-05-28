require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryBot.build(:product) }
  
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
    it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end
end

