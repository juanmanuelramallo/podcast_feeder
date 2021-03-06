# frozen_string_literal: true

xml.instruct!
xml.rss(
  'xmlns:atom' => 'https://www.w3.org/2005/Atom',
  'xmlns:media' => 'https://search.yahoo.com/mrss/',
  # Itunes specification must be http.
  # Spotify requires the rest of the modules to be https
  'xmlns:itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd',
  'xmlns:dcterms' => 'https://purl.org/dc/terms/',
  'xmlns:spotify' => 'https://www.spotify.com/ns/rss',
  'version' => '2.0'
) do
  xml.channel do
    xml.title @podcast.title
    xml.link @podcast.link
    xml.atom :link, href: podcast_url(@podcast, format: :rss), rel: 'self', type: 'application/rss+xml'
    xml.description @podcast.description
    xml.itunes :summary, @podcast.description
    xml.language @podcast.language
    xml.image do
      xml.url polymorphic_url(@podcast.image) if @podcast.image.attached?
      xml.title @podcast.title
      xml.link @podcast.link
    end
    xml.generator 'Podcast Feeder'
    xml.lastBuildDate Time.zone.now.rfc2822
    xml.itunes :author, @podcast.author
    xml.itunes :owner do
      xml.itunes :name, @podcast.author
      xml.itunes :email, @podcast.email
    end
    xml.itunes :image, href: polymorphic_url(@podcast.image) if @podcast.image.attached?
    xml.itunes :explicit, @podcast.explicit
    xml.itunes :category, text: @podcast.category do
      xml.itunes :category, text: @podcast.subcategory if @podcast.subcategory.present?
    end
    xml.itunes :type, @podcast.channel_type

    xml.spotify :limit, recentCount: @podcast.limit
    xml.spotify :countryOfOrigin, @podcast.country_of_origin

    @episodes.each do |episode|
      next unless episode.duration.present?

      xml.item do
        xml.guid episode.guid, isPermaLink: false
        xml.pubDate episode.pub_date
        xml.title episode.title
        xml.description episode.description
        if episode.audio_file.attached?
          xml.enclosure url: polymorphic_url(episode.audio_file), type: episode.audio_file.content_type,
                        length: episode.audio_file.byte_size
        end
        xml.itunes :duration, episode.duration
        xml.itunes :explicit, episode.explicit
        xml.itunes :image, href: polymorphic_url(episode.image) if episode.image.attached?
      end
    end
  end
end
