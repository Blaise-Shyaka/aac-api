class Delegate::RegistrationsController < ApplicationController
  def create
    @active_convention = Convention.where(active: true).first
    @registration = @active_convention.registrations.new(permitted_params)
    if @registration.save!
      RegistrationMailer.with(delegate: @registration).confirm_registration.deliver_later
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
    params.require(:registration).permit(:first_name, :last_name, :country, :phone_number, :passport_number, :email, :sex, :birth_date)
  end

  # def confirm_registration_params
  #   params.require(:registration).permit(:registration_id)
  # end
end