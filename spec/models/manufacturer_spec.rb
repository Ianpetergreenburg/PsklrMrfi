require 'rails_helper'

 RSpec.describe Manufacturer, type: :model do
  let(:manufacturer) { create(:manufacturer) }
  describe 'attributes' do
    it 'has a name' do
      expect(manufacturer.name).to eq "The Confederation of Ham Manufacturing Concern"
    end
  end

    describe 'validations' do
      it 'is valid when its name comes from the special list of manufacturers' do
        should validate_inclusion_of(:name).in_array(["US Robotics", "Mechanical Men Group", "Cyberdyne Systems", "Barry's Automotons", "The Confederation of Ham Manufacturing Concern"])
      end

      it 'is not valid when its name comes from the special list of manufacturers' do
        should_not allow_values('Sirius Cybernetics Corps').for(:name)
      end
    end

    describe 'associations' do
      it 'has many prototypes' do
        should have_many(:prototypes)
      end
    end
end
