class EntryMailer < ActionMailer::Base
  default :from => "rafflematron@gmail.com"

  def registration_confirmation(user, raffle, request)
    @user = user
    @raffle = raffle
    @request = request
    mail(:to => user.email, :subject => "Entry Confirmation")
  end

  def message_winners(user, raffle, message)
    @user = user
    @raffle = raffle
    @message = message
    mail(:to => user.email, :subject => "Congratulations, You're a Winner")
  end
end
