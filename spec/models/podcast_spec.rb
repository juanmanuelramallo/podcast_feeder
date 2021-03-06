# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Podcast, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:episodes) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:channel_type) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:language) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:target_countries) }
    it { is_expected.to validate_presence_of(:title) }
  end
end
