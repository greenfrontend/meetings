# frozen_string_literal: true

class Event < ApplicationRecord
  include AASM

  validates :title, :location, :start_time, presence: true
  belongs_to :user

  aasm column: 'state' do
    state :pending, initial: true
    state :approved, :declined

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :decline do
      transitions from: :pending, to: :declined
    end
  end
end
