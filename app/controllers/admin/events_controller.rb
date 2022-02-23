# frozen_string_literal: true

module Admin
  class EventsController < Admin::BaseController
    before_action :set_event, only: %i[show edit update destroy approve decline]

    def index
      @events = Event.pending.page(params[:page]).per(10).order('updated_at DESC')
    end

    def edit; end

    def show; end

    def update
      if @event.update(event_params)
        redirect_to admin_events_path, notice: t('.updated')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize Event
      @event.destroy

      redirect_to admin_events_path, status: :see_other, notice: t('.deleted')
    end

    def approve
      @event.approve!
      redirect_to admin_events_path, notice: t('.approved')
    end

    def decline
      @event.decline!
      redirect_to admin_events_path, notice: t('.declined')
    end

    private

    def set_event
      @event = Event.find(params[:id])
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
end
