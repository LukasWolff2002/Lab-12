class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    #before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        posts_path # redirige a posts#index
    end

    def after_sign_up_path_for(resource)
        posts_path # redirige a posts#index
    end
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password])
    end
  end