# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Podcast, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:channel_type) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:language) }
    it { is_expected.to validate_presence_of(:target_countries) }
    it { is_expected.to validate_presence_of(:title) }
  end
end
