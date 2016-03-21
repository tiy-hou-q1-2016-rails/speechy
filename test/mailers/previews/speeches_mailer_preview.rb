# Preview all emails at http://localhost:3000/rails/mailers/speeches_mailer
class SpeechesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/speeches_mailer/share
  def share

    the_speech = Speech.create! title: "JWO RULES", author: "JWO", content: 50.times.map { "JWO RULES"}.join("\n\n")
    SpeechesMailer.share(the_speech)
  end

end
