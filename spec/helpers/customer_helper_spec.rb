require 'rails_helper'

describe CustomerHelper, type: :helper do
  let!(:manufacturer) { create(:manufacturer) }
  let!(:pending1) { create(:pending_robot, manufacturer: manufacturer) }
  let!(:pending2) { create(:pending_robot, manufacturer: manufacturer) }
  let!(:robot1) { create(:robot, manufacturer: manufacturer) }
  let!(:robot2) { create(:robot, manufacturer: manufacturer) }

  describe "#get_inventory" do
    it 'retrieves robots in inventory' do
      expect(get_inventory).to eq [robot1, robot2]
    end
  end

  describe "#get_manufacturers" do
    it 'retrieves manufacturers of robots in inventory' do
      expect(get_manufacturers).to eq [manufacturer]
    end
  end
end
