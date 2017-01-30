require 'rails_helper'

feature 'visiting the home page' do
  scenario "presented with question" do
    visit "/"
    expect(page).to have_content('WHAT ARE YOU?')
  end
  scenario "confirming BBSM status brings you to tina page" do
    visit "/"
    click_link "martials arts master that likes to hang out near powerplants"
    expect(page).to_not have_content('HOW LONG IS YOUR ARM?')
  end
  scenario "not confirming BBSM status brings you to second question" do
    visit "/"
    click_link "totally normal, legal person"
    expect(page).to have_content('HOW LONG IS YOUR ARM?')
  end
end

feature 'seeing the second question' do
  scenario "confirming BBSM status brings you to tina page" do
    visit "/home2"
    click_link "Longer than standard human length."
    expect(page).to_not have_content('login')
  end
  scenario "not confirming BBSM status brings you to second question" do
    visit "/home2"
    click_link "Standard, human length."
    expect(page).to have_content('login')
  end
end
