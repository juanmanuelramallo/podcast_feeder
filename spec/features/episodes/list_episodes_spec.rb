# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'List episodes' do
  scenario 'list episodes for a podcast' do
    podcast = create(:podcast)
    episodes = create_list(:episode, 5, podcast: podcast)

    visit podcast_path(podcast)

    episodes.each do |episode|
      expect(page).to have_text(episode.title)
    end
  end
end
