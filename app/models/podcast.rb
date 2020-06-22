# frozen_string_literal: true

# == Schema Information
#
# Table name: podcasts
#
#  id               :bigint           not null, primary key
#  author           :string           not null
#  category         :string           not null
#  channel_type     :integer          not null
#  complete         :boolean          default(FALSE), not null
#  description      :string           not null
#  explicit         :boolean          default(FALSE), not null
#  language         :string           not null
#  limit            :integer
#  target_countries :string           is an Array
#  title            :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Podcast < ApplicationRecord
  validates :author, :channel_type, :category, :description, :language, :target_countries,
            :title, presence: true

  enum channel_type: {
    episodic: 0,
    serial: 1
  }
end
