# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password_digest { BCrypt::Password.create('test') }
    role { 'User' }

    sequence :reset_password_token do |_n|
      'token'
    end

    sequence :reset_password_token_created_at do |_n|
      Time.zone.now
    end

    trait :admin do
      sequence(:email) { |n| "admin#{n}@example.com" }
      password_digest { BCrypt::Password.create('admin') }
      role { 'Admin' }
    end
  end

  factory :event do
    title { 'Event' }
    location { 'Moscow' }
    start_time { Time.zone.now }
    sequence(:organizer_email) { |n| "org#{n}@example.com" }
    sequence(:organizer_telegram) { |n| "org#{n}" }
    link { 'http://google.com' }
    user
  end
end
# rubocop:enable Metrics/BlockLength
