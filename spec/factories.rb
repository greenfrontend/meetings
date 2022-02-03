# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password_digest { BCrypt::Password.create('test') }
    role { 'User' }

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
