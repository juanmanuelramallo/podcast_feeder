# frozen_string_literal: true

FactoryBot.define do
  factory :episode do
    guid { SecureRandom.uuid }
    pub_date { Faker::Time.forward(days: 10, period: :morning) }
    title { Faker::Book.title }
    description { Faker::Lorem.sentence }
    explicit { [false, true].sample }
    keywords { Faker::Lorem.words.join(',') }

    after(:create) do |episode|
      audio = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/audio.mp3'), 'audio/mp3')
      image = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/image.jpg'), 'image/jpg')

      episode.audio_file.attach(audio)
      episode.image.attach(image)
    end
  end
end
