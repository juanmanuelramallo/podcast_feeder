# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:podcast) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:keywords) }
    it { is_expected.to validate_presence_of(:pub_date) }
  end
end
