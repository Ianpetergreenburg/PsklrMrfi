require 'rails_helper'

feature 'visiting the login page' do
  let!(:user) { create(:user) }

  scenario 'there is a login form' do
    visit '/login'
    expect(page).to have_css('div.login_form')
  end

  scenario 'filling out form with legit info logs you in' do
    visit '/login'
    fill_in 'session_username', :with => user.username
    fill_in 'session_password', :with => attributes_for(:user)[:password]
    find('input[name="commit"]').click
    expect(page).to have_css('div#welcome_container')
  end

  scenario 'filling out form with nonlegit info doesn\'t log you in' do
    visit '/login'
    fill_in 'session_username', :with => user.username
    fill_in 'session_password', :with => ("b" + attributes_for(:user)[:password])
    find('input[name="commit"]').click
    expect(page).to_not have_css('div#welcome_container')
  end
end
