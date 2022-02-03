# frozen_string_literal: true

module Admin
  class EventsController < Admin::BaseController
    before_action :set_event, only: %i[edit update destroy]

    def index
      @events = Event.page(params[:page]).per(10).order('updated_at DESC')
    end

    def edit; end

    def update
      if @event.update(event_params)
        redirect_to admin_events_path, notice: t('.updated')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @event.destroy

      redirect_to admin_events_path, status: :see_other, notice: t('.deleted')
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
