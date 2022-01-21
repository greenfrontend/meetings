# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, :location, :start_time, presence: true
end
