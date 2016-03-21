class SpeechesMailer < ApplicationMailer

  def share(the_speech)
    @speech = the_speech

    mail to: "to@example.org"
  end
end
