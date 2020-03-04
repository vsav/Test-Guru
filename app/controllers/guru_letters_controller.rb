# frozen_string_literal: true

class GuruLettersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  def new
    @guru_letter = GuruLetter.new
  end

  def create
    @guru_letter = GuruLetter.new(letter_params)

    if @guru_letter.valid?
      GuruLettersMailer.contact_us(@guru_letter).deliver_now
      redirect_to new_guru_letter_url, notice: t('.success')
    else
      render :new
    end
  end

  private

  def letter_params
    params.require(:guru_letter).permit(:name, :email, :message)
  end
end
