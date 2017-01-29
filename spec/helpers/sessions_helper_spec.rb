require 'rails_helper'

describe SessionsHelper, type: :helper do
  let!(:user) { create(:user) }
  let!(:admin) { create(:admin) }

  describe "#current_user" do
    it 'returns the current user' do
      log_in(user)
      expect(current_user).to eq user
    end

    it 'returns nil if not logged in' do
      expect(current_user).to be_nil
    end
  end

  describe "#logged_in?" do
    it 'returns the user if user logged in' do
      log_in(user)
      expect(logged_in?).to eq user
    end

    it 'returns nil if user isn\'t logged in' do
      expect(logged_in?).to be_nil
    end
  end

  describe "#current_user_commissioner" do
    it 'returns true if user is the admin' do
      log_in(admin)
      expect(current_user_commissioner).to be true
    end

    it 'returns false if user isn\'t the admin' do
      log_in(user)
      expect(current_user_commissioner).to be false
    end
  end

  describe "#log_in(user)" do
    it 'logs the user in' do
      log_in(user)
      expect(current_user).to eq user
    end
  end

  describe "#logout" do
    it 'logs the user out' do
      log_in(user)
      expect(current_user).to eq user
      log_out
      expect(current_user).to be_nil
    end
  end
end
