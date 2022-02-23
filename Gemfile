# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'aasm'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'config'
gem 'cssbundling-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'kaminari'
gem 'mailgun-ruby', '~>1.2.5'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.1'
gem 'sidekiq'
gem 'simple_form'
gem 'slim-rails'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'i18n-debug'
  gem 'letter_opener'
  gem 'letter_opener_web', '~> 2.0'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', '~> 0.17.1', require: false
end
