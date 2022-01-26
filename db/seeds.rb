# frozen_string_literal: true

require 'faker'

def event
  title = "Event about #{Faker::Lorem.sentence(word_count: 3)}"
  location = "#{Faker::Address.city}, #{Faker::Address.street_address}, #{Faker::Address.secondary_address}"

  {
    title:,
    description: Faker::Lorem.sentence(word_count: 7, supplemental: false, random_words_to_add: 3),
    location:,
    start_time: 2.days.from_now,
    end_time: 4.days.from_now,
    organizer_email: Faker::Internet.email,
    organizer_telegram: Faker::Internet.username,
    link: '/link'
  }
end

def user
  first, last = Faker::Name.unique.name.split
  {
    first_name: first,
    last_name: last,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  }
end

events_poster = User.create!(user)

30.times do
  events_poster.events.create!(event)
end
