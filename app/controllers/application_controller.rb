class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # User Adminの場合分けは最後にやる
  # sign_in後にどこに遷移するのか設定
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_users_path
    when User
      public_user_path(current_user)
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :user
      public_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
