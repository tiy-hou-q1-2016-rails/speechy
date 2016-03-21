require 'securerandom'
# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/confirmation
  def confirmation

    user = User.create! email: "jwo@example.com", password: "12345678", confirm_token: SecureRandom.hex 

    UserMailer.confirmation(user)
  end

end
