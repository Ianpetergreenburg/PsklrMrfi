require 'rails_helper'

feature 'visiting the registration page' do
  let!(:user) { build(:user) }

  scenario 'there is a registration form' do
    visit '/users/new'
    expect(page).to have_css('div.registration_form')
  end

  scenario 'filling out form with legit info logs you in' do
    visit '/users/new'

    fill_in 'user_username', :with => user.username
    fill_in 'user_first_name', :with => user.first_name
    fill_in 'user_last_name', :with => user.last_name
    fill_in 'user_email', :with => user.email

    fill_in 'user_password', :with => attributes_for(:user)[:password]
    fill_in 'user_password_confirmation', :with => attributes_for(:user)[:password]

    find('input[name="commit"]').click
    expect(page).to have_css('div#welcome_container')
  end

  scenario 'filling out form with nonlegit info doesn\'t log you in' do
    visit '/users/new'

    find('input[name="commit"]').click
    expect(page).to_not have_css('div#welcome_container')
  end
end
