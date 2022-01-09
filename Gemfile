# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.0.3'

gem 'aws-sdk-s3', require: false
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'sass-rails', '>= 6'
gem 'simple_form', '~> 5.0.2'
gem 'tailwindcss-rails'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.7.5'
  gem 'factory_bot_rails', '~> 6.0.0'
  gem 'faker', '~> 2.12.0'
  gem 'i18n-tasks', '~> 0.9.31'
  gem 'rspec-rails', '~> 4.0.1'
end

group :development do
  gem 'annotate', '~> 3.1.1'
  gem 'heavens_door', '~> 0.3.0'
  gem 'listen', '~> 3.2'
  gem 'pry-rails'
  gem 'rubocop', '~> 0.85.1', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 3.33.0'
  gem 'rspec-log_matcher', '~> 1.1'
  gem 'selenium-webdriver', '~> 3.0'
  gem 'shoulda-matchers', '~> 4.3.0'
  gem 'simplecov', '~> 0.17.1', require: false
  gem 'webdrivers', '~> 3.9', '>= 3.9.4'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
