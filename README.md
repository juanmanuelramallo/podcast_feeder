# Podcast Feeder

[![CI](https://github.com/juanmanuelramallo/podcast_feeder/workflows/CI/badge.svg)](https://github.com/juanmanuelramallo/podcast_feeder/actions?query=workflow%3ACI)

A CMS for Podcast episodes that renders an RSS feed.

# Modeling

In order to match the standards used by most platforms we follow [Spotify's delivery specification v1.6](https://podcasters.spotify.com/terms/Spotify_Podcast_Delivery_Specification_v1.6.pdf).
It includes support for iTunes' standard.

### Podcast (channel)

1. title: string
1. link: URL **
1. description: string
1. language: string (https://www.w3.org/TR/REC-html40/struct/dirlang.html#langcodes)
1. itunes:
   1. author: string
   1. image: URL
   1. explicit: boolean (yes|clean)
   1. category: string
   1. complete: boolean (yes|no)
   1. channel_type: string (episodic|serial)
1. spotify:
   1. limit: integer *
   1. countryoforigin: array of string (ISO3166[])

<sub>
\* optional <br>
** not in database
</sub>
