# frozen_string_literal: true

module UserService
  class << self
    include Rails.application.routes.url_helpers

    def send_link_for_reset_password(user)
      token = SecureRandom.base58(32)
      link = "#{edit_password_path}?token=#{token}"

      user.update({
                    reset_password_token: token,
                    reset_password_token_created_at: Time.current
                  })

      UserMailer.with({
                        user:,
                        link:
                      }).reset_password_token_created.deliver_now
    end
  end
end
