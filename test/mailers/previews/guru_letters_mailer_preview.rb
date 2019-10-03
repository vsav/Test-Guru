class GuruLettersMailerPreview < ActionMailer::Preview

  def contact_us
    letter = GuruLetter.new(name: 'username',
                            email: 'username@example.org',
                            message: 'message example')

    GuruLettersMailer.contact_us(letter)
  end

end
