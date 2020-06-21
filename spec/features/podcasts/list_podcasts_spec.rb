require 'rails_helper'

RSpec.feature 'List podcasts' do
  scenario 'list podcasts in the system' do
    podcasts = create_list(:podcast, 5)

    visit podcasts_path

    podcasts.each do |podcast|
      expect(page).to have_text(podcast.title)
    end
  end
end
