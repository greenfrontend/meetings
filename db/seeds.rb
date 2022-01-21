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

30.times do
  Event.create!(event)
end
