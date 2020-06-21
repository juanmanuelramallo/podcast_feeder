require 'rails_helper'

RSpec.feature 'Edit a podcast' do
  scenario 'edits a podcast successfully' do
    podcast = create(:podcast)

    visit podcast_path(podcast)

    click_link 'Edit'

    fill_in 'Title', with: 'New title'
    click_button 'Update Podcast'

    expect(page).to have_text('Podcast was successfully updated.')
    expect(page).to have_text('New title')
  end
end
