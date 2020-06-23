# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Edit an episode' do
  scenario 'edits an episode successfully' do
    podcast = create(:podcast)
    episode = create(:episode, podcast: podcast)

    visit podcast_path(podcast)

    within "#episode-#{episode.id}" do
      click_link 'Edit'
    end

    fill_in 'Title', with: 'Updated title'
    click_button 'Update Episode'

    expect(page).to have_text('Episode was successfully updated.')
  end
end
