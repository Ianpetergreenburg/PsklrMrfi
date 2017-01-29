require 'rails_helper'

RSpec.describe Robot, type: :model do
  describe 'validations' do
    it { is_expected.to validate_numericality_of :height }
    it { is_expected.to validate_numericality_of :weight }
    it { is_expected.to validate_numericality_of :manufacturer_id }
    it { is_expected.to validate_presence_of :height }
    it { is_expected.to validate_presence_of :weight }
    it { is_expected.to validate_presence_of :model_no }
  end

  describe 'associations' do
    it { is_expected.to belong_to :manufacturer }
  end

  describe '#inventory' do

    let!(:pending1) { create(:pending_robot) }
    let!(:pending2) { create(:pending_robot) }
    let!(:robot1) { create(:robot) }
    let!(:robot2) { create(:robot) }

    it 'returns all non pending robots' do
      expect(Robot.inventory).to eq([robot1, robot2])
    end
  end
end

