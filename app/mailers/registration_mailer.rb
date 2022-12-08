class RegistrationMailer < ApplicationMailer
  default from: "AAC 2023 Team, no-reply@arsenalafricaconvention.rw"

  def confirm_registration
    @delegate = params[:delegate]
    mail(to: @delegate.email, subject: "Arsenal Africa Convention: Confirm Email!")
  end
end
