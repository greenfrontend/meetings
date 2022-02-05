class EventService < ApplicationService
  def initialize(event_id)
    @event_id = event_id
  end

  def call
    url = Rails.application.routes.url_helpers.admin_event_url(@event_id)
    AdminMailer.with(url: url).created_event_email.deliver_now
  end
end
