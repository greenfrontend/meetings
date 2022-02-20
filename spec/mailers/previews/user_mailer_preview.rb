# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def reset_password_token_created
    UserMailer.with({ link: '/some', user: User.first }).reset_password_token_created
  end
end