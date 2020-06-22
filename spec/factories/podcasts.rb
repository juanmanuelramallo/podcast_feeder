# frozen_string_literal: true

FactoryBot.define do
  factory :podcast do
    author { Faker::Name.name }
    category { Faker::Book.genre }
    channel_type { Podcast.channel_types.values.sample }
    complete { [false, true].sample }
    description { Faker::Quote.yoda }
    explicit { [false, true].sample }
    language { %w[en es].sample }
    limit { [nil, -> { rand(0..10) }].sample&.call }
    target_countries { [['uy'], %w[ar uy], %w[ar bo uy]].sample }
    title { Faker::Book.title }
  end
end
