require 'rails_helper'

RSpec.feature 'Destroy a podcast' do
  scenario 'destroys a podcast successfully', js: true do
    create(:podcast)

    visit '/podcasts'

    accept_confirm do
      click_link 'Destroy'
    end

    expect(page).to have_text('Podcast was successfully destroyed.')
  end
end
