require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.build(:order) }

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:phone) }
  end

  context 'validations' do
    
    it 'is invalid without a firstname' do
      order.first_name = nil
      expect(order).not_to be_valid
    end

    it 'is invalid without a lastname' do
      order.last_name = nil
      expect(order).not_to be_valid
    end

    it 'is invalid without an address' do
      order.address = nil
      expect(order).not_to be_valid
    end

    it 'is invalid without a phone' do
      order.phone = nil
      expect(order).not_to be_valid
    end
  end
end

