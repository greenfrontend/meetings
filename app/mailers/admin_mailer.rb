# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  default to: -> { User.admins.pluck(:email) }

  def created_event_email
    @url = params[:url]
    mail(subject: t('.subject'))
  end
end
