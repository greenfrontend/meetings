# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).per(10).order('updated_at DESC')
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.create(event_params)

    if @event.save
      redirect_to root_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])

    if @event.update(event_params)
      redirect_to root_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other, notice: t('.deleted')
  end

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :location,
      :start_time,
      :end_time,
      :organizer_email,
      :organizer_telegram,
      :link
    )
  end
end
