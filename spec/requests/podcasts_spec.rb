# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Podcasts' do
  describe 'xml' do
    it 'renders an xml' do
      podcast = create(:podcast)
      presenter = PodcastPresenter.new(podcast)

      get podcast_path(podcast, format: :rss)

      body = response.body

      expect(body).to eq <<~XML
        <rss version="2.0" xmlns:media="https://search.yahoo.com/mrss/" xmlns:itunes="https://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:dcterms="https://purl.org/dc/terms/" xmlns:spotify="https://www.spotify.com/ns/rss" xmlns:psc="https://podlove.org/simple-chapters/">
          <channel>
            <title>#{podcast.title}</title>
            <link>#{podcast_url(podcast.id)}</link>
            <description>#{podcast.description}</description>
            <language>#{podcast.language}</language>
            <itunes:author>#{podcast.author}</itunes:author>
            <itunes:explicit>#{presenter.explicit}</itunes:explicit>
            <itunes:category text="#{podcast.category}"/>
            <itunes:complete>#{presenter.complete}</itunes:complete>
            <itunes:type>#{podcast.channel_type}</itunes:type>
            <spotify:limit recentCount="#{podcast.limit}"/>
            <spotify:countryOfOrigin>#{presenter.country_of_origin}</spotify:countryOfOrigin>
          </channel>
        </rss>
      XML
    end
  end
end
