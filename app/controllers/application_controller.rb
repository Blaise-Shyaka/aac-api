class ApplicationController < ActionController::API
  def is_admin
    current_user.is_admin
  end
end
