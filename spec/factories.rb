# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    sequence(:email) { |n| "person#{n}@example.com" }
    password_digest { BCrypt::Password.create('test') }
  end

  factory :event do
    title { 'Event' }
    location { 'Moscow' }
    start_time { Time.zone.now }
    user
  end
end
