# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(10).order('updated_at DESC')
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other
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
