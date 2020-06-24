# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Podcasts' do
  describe 'xml' do
    it 'renders an xml' do
      podcast = PodcastPresenter.new(create(:podcast))
      episodes = EpisodePresenter.all(
        create_list(:episode, 5, podcast: podcast.object).sort_by(&:pub_date).reverse
      )
      create(:episode, podcast: podcast.object) # Episode with audio file not analyzed is not shown
      episodes.map(&:audio_file).each(&:analyze)

      get podcast_path(podcast, format: :rss)
      body = response.body
      episodes_xml = episodes.map do |episode|
        <<-XML
    <item>
      <guid isPermaLink="false">#{episode.guid}</guid>
      <pubDate>#{episode.pub_date}</pubDate>
      <title>#{episode.title}</title>
      <description>#{episode.description}</description>
      <enclosure url="#{polymorphic_url(episode.audio_file)}" type="#{episode.audio_file.content_type}" length="#{episode.audio_file.byte_size}"/>
      <media:content type="#{episode.audio_file.content_type}" url="#{polymorphic_url(episode.audio_file)}"/>
      <itunes:duration>#{episode.duration}</itunes:duration>
      <itunes:explicit>#{episode.explicit}</itunes:explicit>
      <itunes:image href="#{polymorphic_url(episode.image)}"/>
    </item>
        XML
      end.join

      podcast_xml = <<~XML
        <rss version="2.0" xmlns:media="https://search.yahoo.com/mrss/" xmlns:itunes="https://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:dcterms="https://purl.org/dc/terms/" xmlns:spotify="https://www.spotify.com/ns/rss" xmlns:psc="https://podlove.org/simple-chapters/">
          <channel>
            <title>#{podcast.title}</title>
            <link>#{podcast_url(podcast.id)}</link>
            <description>#{podcast.description}</description>
            <language>#{podcast.language}</language>
            <image>
              <url>#{polymorphic_url(podcast.image)}</url>
              <title>#{podcast.title}</title>
              <link>#{podcast_url(podcast.id)}</link>
            </image>
            <generator>Podcast Feeder</generator>
            <lastBuildDate>#{Time.zone.now.rfc2822}</lastBuildDate>
            <author>#{podcast.author}</author>
            <itunes:author>#{podcast.author}</itunes:author>
            <itunes:owner>
              <itunes:name>#{podcast.author}</itunes:name>
              <itunes:email>#{podcast.email}</itunes:email>
            </itunes:owner>
            <itunes:image href="#{polymorphic_url(podcast.image)}"/>
            <itunes:explicit>#{podcast.explicit}</itunes:explicit>
            <itunes:category text="#{podcast.category}"/>
            <itunes:complete>#{podcast.complete}</itunes:complete>
            <itunes:type>#{podcast.channel_type}</itunes:type>
            <spotify:limit recentCount="#{podcast.limit}"/>
            <spotify:countryOfOrigin>#{podcast.country_of_origin}</spotify:countryOfOrigin>
            #{episodes_xml.strip}
          </channel>
        </rss>
      XML

      expect(body).to eq podcast_xml
    end
  end
end
