# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, :location, :starttime, presence: true
end
