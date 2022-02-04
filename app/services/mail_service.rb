require 'mailgun-ruby'

class MailService
  def self.send(mail)
    api_key = ENV['MAILGUN_API_KEY']
    domain = ENV['MAILGUN_DOMAIN']

    mg_client = Mailgun::Client.new api_key

    message_params =  { from: "notifications@#{domain}",
                        to:   mail,
                        subject: 'The Ruby SDK is awesome!',
                        text:    'It is really easy to send a message!'
                      }

    mg_client.send_message domain, message_params
  end
end
