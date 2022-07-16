class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:tel,:headhunt])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:tel,:email,:line_id,:residence,:birth_date,:career,:appeal,:headhunt,:bank,:branch,:account_type,:account_no])
      devise_parameter_sanitizer.permit(:invite, keys: [:email, :name, :tel,:headhunt])
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:password, :password_confirmation, :name, :tel])
    end

 

  def after_sign_up_path_for(resource)
  case resource
    when User
      "/users/complete/#{current_user.id}"
    when Provider
      "/works"
    end

  end
   def after_sign_in_path_for(resource)
    case resource
    when User
       "/users/complete/#{current_user.id}"
    when Provider
      "/works"

    end
  end

  def after_invite_path_for(resource)
    case resource
    when User
    introductions_complete_path
    when Provider
    tops_addprovidercomp_path
    end
  end

  def after_update_path_for(resource)
    case resource
    when Provider
    # 自分で設定した「マイページ」へのパス
    "/works"
    end
  end

  
end
