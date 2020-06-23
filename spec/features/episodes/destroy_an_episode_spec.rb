# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Destroy an episode' do
  scenario 'destroys an episode successfully', js: true do
    podcast = create(:podcast)
    episode = create(:episode, podcast: podcast)

    visit podcast_path(podcast)

    within "#episode-#{episode.id}" do
      accept_confirm do
        click_link 'Destroy'
      end
    end

    expect(page).to have_text('Episode was successfully destroyed.')
  end
end
