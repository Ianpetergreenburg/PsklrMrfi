require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :username }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to have_secure_password }
  end

  describe '#admin?' do
    it 'should be false by default' do
      expect(create(:user).admin?).to be false
    end

    it 'should be true for admin users' do
      expect(create(:admin).admin?).to be true
    end
  end
end
