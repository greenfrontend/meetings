# frozen_string_literal: true

module EventService
  class << self
    include Rails.application.routes.url_helpers

    def notify_admins_on_create_event(event)
      url = admin_event_url(event.id)
      SendEventCreatedMailJob.perform_async(url)
    end
  end
end
