class OverdueMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.overdue_mailer.overdue_book_email.subject
  #
  def overdue_book_email(user)
    @user = user

    mail to: @user.email, subject: "Book Overdue"
  end
end
