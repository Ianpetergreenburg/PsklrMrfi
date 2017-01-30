require 'rails_helper'

feature 'visiting the tina page' do
  scenario 'nothing is there except tina warning' do
    visit '/tina'
    expect(page).to have_content('THIS IS NOT A')
  end
end

feature 'visiting the tina login page' do
  scenario 'there is a tina warning' do
    visit '/login_tina'
    expect(page).to have_content('THIS IS NOT A')
  end

  scenario 'click register to go to new user form' do
    visit '/login_tina'
    click_link 'register'
    expect(page).to have_css('div.registration_form')
  end

  scenario 'click login to go to login form' do
    visit '/login_tina'
    click_link 'login'
    expect(page).to have_css('div.login_form')
  end
end
