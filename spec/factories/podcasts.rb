# frozen_string_literal: true

FactoryBot.define do
  factory :podcast do
    author { Faker::Name.name }
    email { Faker::Internet.email }
    category { Faker::Book.genre }
    subcategory { Faker::Book.genre }
    channel_type { Podcast.channel_types.values.sample }
    description { Faker::Quote.yoda }
    explicit { [false, true].sample }
    language { %w[en es].sample }
    limit { [nil, -> { rand(0..10) }].sample&.call }
    link { Faker::Internet.domain_name }
    slug { Faker::Internet.slug }
    target_countries { [['uy'], %w[ar uy], %w[ar bo uy]].sample }
    title { Faker::Book.title }

    after(:create) do |podcast|
      image = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/image.jpg'), 'image/jpg')

      podcast.image.attach(image)
    end
  end
end
