require 'rails_helper'

RSpec.feature 'Create a podcast' do
  scenario 'creates a podcast successfully' do
    visit '/podcasts'

    click_link 'New Podcast'

    fill_in 'Title', with: 'Talking Roots'
    fill_in 'Description', with: 'Test'
    fill_in 'Language', with: 'es'
    fill_in 'Author', with: 'Rootstrap'
    fill_in 'Category', with: 'Technology'
    select 'episodic', from: 'Channel type'
    fill_in 'Target countries', with: 'uy ar'
    click_button 'Create Podcast'

    expect(page).to have_text('Podcast was successfully created.')
  end
end
