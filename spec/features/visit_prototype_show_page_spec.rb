require 'rails_helper'

feature 'visiting the prototype show page' do
  let!(:prototype) { create(:prototype) }
  scenario "when visiting the page the prototype's height no is present" do
    visit "/prototypes/#{prototype.id}"
    p prototype
    expect(page).to have_content(prototype.height)
  end
end
