FactoryBot.define do
  factory :podcast do
    author { Faker::Name.name }
    category { Faker::Book.genre }
    channel_type { Podcast.channel_types.values.sample }
    complete { [false, true].sample }
    description { Faker::Quote.yoda }
    explicit { [false,true].sample }
    language { ['en', 'es'].sample }
    limit { [nil, -> { rand(0..10) }].sample&.call }
    target_countries { [['uy'], ['ar', 'uy'], ['ar', 'bo', 'uy']].sample }
    title { Faker::Book.title }
  end
end
