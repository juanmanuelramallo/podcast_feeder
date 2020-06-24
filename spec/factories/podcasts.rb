# frozen_string_literal: true

FactoryBot.define do
  factory :podcast do
    author { Faker::Name.name }
    email { Faker::Internet.email }
    category { Faker::Book.genre }
    channel_type { Podcast.channel_types.values.sample }
    complete { [false, true].sample }
    description { Faker::Quote.yoda }
    explicit { [false, true].sample }
    language { %w[en es].sample }
    limit { [nil, -> { rand(0..10) }].sample&.call }
    target_countries { [['uy'], %w[ar uy], %w[ar bo uy]].sample }
    title { Faker::Book.title }

    after(:create) do |podcast|
      image = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/image.jpg'), 'image/jpg')

      podcast.image.attach(image)
    end
  end
end
