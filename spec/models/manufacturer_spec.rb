require 'rails_helper'

 RSpec.describe Manufacturer, type: :model do
  let(:manufacturer) { create(:manufacturer) }
  describe 'attributes' do
    it 'has a name' do
      expect(manufacturer.name).to eq "Stamm Inc"
    end
  end

    describe 'validations' do
      it 'is valid when its name is present' do
        should validate_presence_of(:name)
      end
    end

    describe 'associations' do
      it 'has many prototypes' do
        should have_many(:prototypes)
      end
    end
end
