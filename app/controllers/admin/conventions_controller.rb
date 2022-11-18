class Admin::ConventionsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin_credentials

  def create
    @convention = current_user.conventions.new(permitted_params)
    if @convention.save!
      render json: { status: 201, data: ConventionSerializer.new(@convention).serializable_hash[:data][:attributes] }
    else
      render json: { error: { status: 422, message: I18n.t('errors.unprocessable_entity') } }
    end
  end

  private
  def permitted_params
    params.require(:convention).permit(:title, :theme, :active)
  end

  def verify_admin_credentials
    if !is_admin
      render json: { error: {code: 401, message: I18n.t('errors.admin_only_access')} }
    end
  end
end