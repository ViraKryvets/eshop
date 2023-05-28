require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.build(:order) }

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:phone) }
  end
end

