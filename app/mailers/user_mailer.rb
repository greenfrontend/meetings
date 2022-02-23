# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def reset_password_token_created
    user = params[:user]
    @link = params[:link]

    mail(to: user.email, subject: t('.subject'))
  end
end
