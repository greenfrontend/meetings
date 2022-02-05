# Preview all emails at http://localhost:3000/rails/mailers/admin
class AdminPreview < ActionMailer::Preview
  def created_event_email
    url = 'http://localhost:3000/admin/events/35'
    AdminMailer.with(url: url).created_event_email
  end
end
