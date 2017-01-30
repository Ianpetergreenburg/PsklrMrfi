require 'rails_helper'

feature 'visiting the login page' do
  let!(:user) { create(:user) }

  scenario 'there is a login form' do
    visit '/login'
    expect(page).to have_css('div.login_form')
  end

  scenario 'filling out form with legit info logs you in' do
    visit '/login'
    fill_in('Username', :with => user.username)
    fill_in('Password', :with => attributes_for(:user)[:password])
    expect(page).to have_css('div.welcome_container')
  end
end
