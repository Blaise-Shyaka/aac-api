class Delegate::RegistrationsController < ApplicationController
  def create
    @active_convention = Convention.where(active: true).first
    @registration = @active_convention.registrations.new(permitted_params)
    if @registration.save!
      render json: { status: 201, data: RegistrationSerializer.new(@registration).serializable_hash[:data][:attributes] }
    else
      render json: { error: { status: 422, message: I18n.t('errors.unprocessable_entity') } }
    end
  end

  private
  def permitted_params
    params.require(:registration).permit(:first_name, :last_name, :country, :phone_number, :passport_number, :email)
  end
end