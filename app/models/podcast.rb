# frozen_string_literal: true

# == Schema Information
#
# Table name: podcasts
#
#  id                  :bigint           not null, primary key
#  apple_podcasts_url  :string           default(""), not null
#  author              :string           not null
#  category            :string           not null
#  channel_type        :integer          not null
#  description         :text             not null
#  email               :string           default(""), not null
#  explicit            :boolean          default(FALSE), not null
#  google_podcasts_url :string           default(""), not null
#  language            :string           not null
#  limit               :integer
#  link                :string
#  slug                :string           default(""), not null
#  spotify_url         :string           default(""), not null
#  subcategory         :string
#  target_countries    :string           is an Array
#  title               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_podcasts_on_slug  (slug) UNIQUE
#
class Podcast < ApplicationRecord
  validates :author, :channel_type, :category, :description, :email, :language, :target_countries,
            :title, :link, presence: true
  validates :slug, uniqueness: true
  validates :apple_podcasts_url, :google_podcasts_url, :spotify_url, url: { allow_blank: true }

  enum channel_type: {
    episodic: 0,
    serial: 1
  }

  has_one_attached :image

  # TODO: Add validation for file types in image attachment

  has_many :episodes
end
