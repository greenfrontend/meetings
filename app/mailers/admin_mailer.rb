# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  default to: -> { User.admins.pluck(:email) },
          from: "notifications@#{ENV['MAILGUN_DOMAIN']}"

  def created_event_email
    @url = params[:url]
    mail(subject: 'New event was created, need approve or decline')
  end
end
