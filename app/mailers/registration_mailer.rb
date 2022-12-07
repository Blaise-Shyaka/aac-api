class RegistrationMailer < ApplicationMailer
  def confirm_registration
    @delegate = params[:delegate]
    mail(to: @delegate.email, subject: "Arsenal Africa Convention: Confirm Email!")
  end
end
