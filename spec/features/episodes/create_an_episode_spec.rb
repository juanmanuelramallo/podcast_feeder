# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create an episode' do
  scenario 'it creats an episode successfully' do
    podcast = create(:podcast)

    visit podcast_path(podcast)

    click_link 'Create episode'

    fill_in 'Title', with: 'Episode 1: The beginning'
    fill_in 'Description', with: 'Some description'
    select '2021', from: 'Pub date'
    select 'July', from: 'episode_pub_date_2i'
    select '24', from: 'episode_pub_date_3i'
    select '02', from: 'episode_pub_date_4i'
    select '40', from: 'episode_pub_date_5i'
    fill_in 'Keywords', with: 'technology,software'
    attach_file 'Image', 'spec/fixtures/image.jpg'
    attach_file 'Audio file', 'spec/fixtures/audio.mp3'

    click_button 'Create Episode'

    expect(page).to have_text('Episode was successfully created.')
  end
end
