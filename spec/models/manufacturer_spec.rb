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
    it{ is_expected.to have_many(:prototypes) }
    it{ is_expected.to have_many(:robots) }
  end

  describe '#names' do
    let!(:manufacturer) { create(:manufacturer) }
    let!(:pending1) { create(:pending_robot, manufacturer: manufacturer) }
    let!(:pending2) { create(:pending_robot, manufacturer: manufacturer) }
    let!(:robot1) { create(:robot, manufacturer: manufacturer) }
    let!(:robot2) { create(:robot, manufacturer: manufacturer) }

    it 'retrieves the manufacturers names' do
      expect(Manufacturer.names).to match_array ["Bailey and Sons", "Stamm Inc", "Jones and Sons", "Quitzon - Wunsch", "Nikolaus and Sons"]
    end

    it 'retrieves the robots in the inventory' do
      expect(manufacturer.inventory_robots).to eq [robot1, robot2]
    end
  end
end
