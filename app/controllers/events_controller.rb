# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(10)
  end
end
