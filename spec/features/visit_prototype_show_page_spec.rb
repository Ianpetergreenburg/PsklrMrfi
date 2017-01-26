require 'rails_helper'

feature 'visiting the prototype show page' do
  let!(:prototype) { create(:prototype) }
  scenario 'when visiting the page the prototypes model no is present' do
    visit "/prototypes/#{prototype.id}"
    expect(page).to have_content(prototype.model_no)
  end
end
