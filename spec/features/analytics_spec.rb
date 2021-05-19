# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Analytics' do
  scenario 'logs analytics information' do
    podcast = create(:podcast)
    create_list(:episode, 5, podcast: podcast)

    visit podcast_path(podcast, test: 'yes')
    expect(page).to log('podcastfeeder-analytics=' + {
      path: "/podcasts/#{podcast.id}",
      query_string: 'test=yes',
      referrer: nil,
      format: 'text/html',
      ip: '127.0.0.1',
      user_agent: nil,
      method: 'GET'
    }.to_json)
  end
end
