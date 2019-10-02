class GuruLettersMailer < ApplicationMailer
  default from: 'vsavdev@gmail.com'

  def contact_us(guru_letter)
    @name = guru_letter.name
    @email = guru_letter.email
    @message = guru_letter.message
    @admin = User.find_by_type('Admin')

    mail to: @admin.email
  end
end
