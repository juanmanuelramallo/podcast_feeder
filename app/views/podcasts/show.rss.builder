# frozen_string_literal: true

xml.rss('version' => '2.0',
        'xmlns:media' => 'https://search.yahoo.com/mrss/',
        'xmlns:itunes' => 'https://www.itunes.com/dtds/podcast-1.0.dtd',
        'xmlns:dcterms' => 'https://purl.org/dc/terms/',
        'xmlns:spotify' => 'https://www.spotify.com/ns/rss',
        'xmlns:psc' => 'https://podlove.org/simple-chapters/') do
  xml.channel do
    xml.title @podcast.title
    xml.link podcast_url(@podcast.id)
    xml.description @podcast.description
    xml.language @podcast.language

    xml.itunes :author, @podcast.author
    xml.itunes :image, href: polymorphic_url(@podcast.image) if @podcast.image.attached?
    xml.itunes :explicit, @podcast.explicit
    xml.itunes :category, text: @podcast.category
    xml.itunes :complete, @podcast.complete
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
          xml.media :content, type: episode.audio_file.content_type, url: polymorphic_url(episode.audio_file)
        end
        xml.itunes :duration, episode.duration
        xml.itunes :explicit, episode.explicit
        xml.itunes :image, href: polymorphic_url(episode.image) if episode.image.attached?
      end
    end
  end
end
