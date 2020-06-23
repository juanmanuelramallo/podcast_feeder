# frozen_string_literal: true

# == Schema Information
#
# Table name: episodes
#
#  id          :bigint           not null, primary key
#  description :string           default(""), not null
#  explicit    :boolean          default(FALSE), not null
#  guid        :uuid             not null
#  keywords    :string           default(""), not null
#  pub_date    :datetime         not null
#  title       :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  podcast_id  :bigint
#
# Indexes
#
#  index_episodes_on_podcast_id  (podcast_id)
#
# Foreign Keys
#
#  fk_rails_...  (podcast_id => podcasts.id)
#
class Episode < ApplicationRecord
  belongs_to :podcast

  has_one_attached :image
  has_one_attached :audio_file

  validates :title, :description, :keywords, :pub_date, presence: true

  # TODO: Add validation for file types in image and audio_file attachments
end
