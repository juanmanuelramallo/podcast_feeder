# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Analytics' do
  scenario 'logs analytics information' do
    podcast = create(:podcast)
    create_list(:episode, 5, podcast: podcast)

    visit podcast_path(podcast)
    expect(page).to log('podcastfeeder-analytics=' + {
      action_name: 'show',
      controller_name: 'podcasts',
      format: 'text/html',
      ip: '127.0.0.1',
      user_agent: nil
    }.to_json)
  end
end
