# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "notifications@#{Settings.mail.domain}"
  layout 'mailer'
end
