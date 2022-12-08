class Delegate::RegistrationsController < ApplicationController
  def create
    @active_convention = Convention.where(active: true).first
    @registration = @active_convention.registrations.new(permitted_params.except(:youth_camps))
    if @registration.save!
      RegistrationMailer.with(delegate: @registration).confirm_registration.deliver_later
      youth_camp_parameters = permitted_params[:youth_camps] && permitted_params.except(:first_name, :last_name, :country, :phone_number, :passport_number, :email, :sex, :birth_date).require(:youth_camps)
      youth_camp_parameters && @registration.youth_camp_registrations.create(youth_camp_parameters)
      render json: { status: 201, data: RegistrationSerializer.new(@registration).serializable_hash[:data][:attributes] }
    else
      render json: { error: { status: 422, message: I18n.t('errors.unprocessable_entity') } }
    end
  end

  def update
    @delegate = Registration.find(params[:id])
    if @delegate.update({ confirmed: true })
      render json: { status: 200, data: RegistrationSerializer.new(@delegate).serializable_hash[:data][:attributes] }
    else
      render json: { error: { status: 400, message: I18n.t('registration_confirmation_failed') } }
    end
  end

  private
  def permitted_params
    params[:registration][:youth_camps].length.zero? ? params.require(:registration).permit(:first_name, :last_name, :country, :phone_number, :passport_number, :email, :sex, :birth_date) : params.require(:registration).permit(:first_name, :last_name, :country, :phone_number, :passport_number, :email, :sex, :birth_date, youth_camps: [:full_name, :birth_date, :sex])
  end
end