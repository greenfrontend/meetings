# frozen_string_literal: true

class ForgotPasswordForm
  include ActiveModel::Model

  attr_accessor(
    :email
  )

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def user
    User.find_by(email:)
  end
end