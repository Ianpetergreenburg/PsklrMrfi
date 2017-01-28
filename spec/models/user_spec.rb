require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user)}
  let(:invalid_user) { User.new() }

  describe 'validations' do
    it 'is valid if username and password_digest exist' do
      expect(user).to be_valid
    end
    it 'is invalid if username or password does not exist' do
      expect(invalid_user).to_not be_valid
    end
  end
end
