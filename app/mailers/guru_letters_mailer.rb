class GuruLettersMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) },
          from: @guru_letter.email

  def contact_us(guru_letter)
    @name = guru_letter.name
    @email = guru_letter.email
    @message = guru_letter.message

    #mail to: @admin.email, from: guru_letter.email
  end
end
