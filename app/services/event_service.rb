module EventService
  class << self
    include Rails.application.routes.url_helpers

    def call(event_id)
      url = admin_event_url(event_id)
      AdminMailer.with(url: url).created_event_email.deliver_now
    end
  end
end
