# frozen_string_literal: true

class SendEventCreatedMailJob
  include Sidekiq::Worker
  queue_as :default

  def perform(url)
    AdminMailer.with(url:).created_event_email.deliver_now
  end
end
