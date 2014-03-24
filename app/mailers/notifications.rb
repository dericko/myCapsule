class Notifications < ActionMailer::Base
  default from: "notes@capsulo.us"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_note.subject
  #
  def new_note(note)
    @greeting = "Hi there!"
    @id = note.id
    @notemaker = note.user.name

    mail to: note.user.email
  end
end
