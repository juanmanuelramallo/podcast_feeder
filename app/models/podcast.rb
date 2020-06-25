# frozen_string_literal: true

# == Schema Information
#
# Table name: podcasts
#
#  id               :bigint           not null, primary key
#  author           :string           not null
#  category         :string           not null
#  channel_type     :integer          not null
#  description      :string           not null
#  email            :string           default(""), not null
#  explicit         :boolean          default(FALSE), not null
#  language         :string           not null
#  limit            :integer
#  link             :string
#  subcategory      :string
#  target_countries :string           is an Array
#  title            :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Podcast < ApplicationRecord
  validates :author, :channel_type, :category, :description, :email, :language, :target_countries,
            :title, :link, presence: true

  enum channel_type: {
    episodic: 0,
    serial: 1
  }

  has_one_attached :image

  # TODO: Add validation for file types in image attachment

  has_many :episodes
end
