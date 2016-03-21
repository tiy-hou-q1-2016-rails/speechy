class UserMailer < ApplicationMailer


  def confirmation(user)
    @user = user
    mail to: user.email, subject: "Please confirm your email b4 you speech"
  end
end
