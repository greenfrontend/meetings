# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(10)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :location,
      :starttime,
      :endtime,
      :organizeremail,
      :organizertelegram,
      :link
    )
  end
end
