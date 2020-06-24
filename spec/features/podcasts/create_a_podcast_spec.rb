# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create a podcast' do
  scenario 'creates a podcast successfully' do
    visit '/podcasts'

    click_link 'New Podcast'

    fill_in 'Title', with: 'Joeron Burgundrogan Podcast'
    fill_in 'Description', with: 'Test'
    attach_file 'Image', 'spec/fixtures/image.jpg'
    fill_in 'Language', with: 'es'
    fill_in 'Author', with: 'Someone'
    fill_in 'Email', with: 'someone@example.com'
    fill_in 'Category', with: 'Technology'
    select 'episodic', from: 'Channel type'
    fill_in 'Target countries', with: 'uy ar'
    click_button 'Create Podcast'

    expect(page).to have_text('Podcast was successfully created.')
  end
end
