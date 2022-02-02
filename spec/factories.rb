# frozen_string_literal: true

FactoryBot.define do
  factory :admin, class: 'User' do
    first_name { 'Ivan' }
    last_name { 'Ivanov' }
    sequence(:email) { |n| "admin#{n}@example.com" }
    password_digest { BCrypt::Password.create('admin') }
    role { 'Admin' }
  end

  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password_digest { BCrypt::Password.create('test') }
    role { 'User' }
  end

  factory :event do
    title { 'Event' }
    location { 'Moscow' }
    start_time { Time.zone.now }
    user
  end
end
