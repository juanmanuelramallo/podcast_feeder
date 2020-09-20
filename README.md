# Podcast Feeder

[![CI](https://github.com/juanmanuelramallo/podcast_feeder/workflows/CI/badge.svg)](https://github.com/juanmanuelramallo/podcast_feeder/actions?query=workflow%3ACI)
[![Maintainability](https://api.codeclimate.com/v1/badges/d2bfe7160d35a46dcbed/maintainability)](https://codeclimate.com/github/juanmanuelramallo/podcast_feeder/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d2bfe7160d35a46dcbed/test_coverage)](https://codeclimate.com/github/juanmanuelramallo/podcast_feeder/test_coverage)

A CMS for Podcast episodes that renders an RSS feed.

# Development

## HTTP Tunneling
First install [npm install -g localtunnel](https://github.com/localtunnel/localtunnel) in your system.

Run `lt --port 3000 --subdomain your-preferred-subdomain` and set the output host to the `LOCAL_TUNNEL_HOST` environment variable. Your local environemnt will now be accesible everywhere through HTTP tunneling thanks to [localtunnel](https://github.com/localtunnel/localtunnel).

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
   1. image: Active Storage
   1. explicit: boolean (yes|clean)
   1. category: string
   1. channel_type: string (episodic|serial)
1. spotify:
   1. limit: integer *
   1. countryoforigin: array of string (ISO3166[])

<sub>
* optional <br>
** not in database
</sub>


### Episodes

1. guid: string
1. enclosure: Active Storage
1. pub_date: DateTime
1. title: string
1. description: string
1. explicit: boolean
1. image: Active Storage
1. keywords: string
