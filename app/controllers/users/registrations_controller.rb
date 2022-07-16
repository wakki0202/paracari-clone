# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   include Accessible
  skip_before_action :check_user, except: [:new, :create]
  # before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]
   prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]
   prepend_before_action :set_minimum_password_length, only: [:new, :edit]
   
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    #スーパークラス(devise)のcreateアクションを呼ぶ 
    # byebug
   super
    if  @user.save
      ThanxMailer.complete_registration(params[:user][:email],params[:user][:name]).deliver 
      "/users/complete/#{current_user.id}"
    else
      new_user_registration_path
    end
  
  end

  # GET /resource/edit
  # def edit
  #   super
  # end


  # PUT /resource
   def update
      super
   end

   def update_resource(resource, params)
    resource.update_with_password(params)
  end

  # DELETE /resource
   def destroy
      # 論理削除処理
    soft_delete(current_user)
    # Deviceの論理削除後の後処理
    respond_with_navigational do
      # 強制ログアウト
      sign_out current_user
      # ログアウト後のページ遷移
      redirect_to tops_destroycomp_path
    end
   
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end

  

  private

  def soft_delete(user)
    # 同じメールアドレスでも登録できるように、
    # メールアドレスを“hoge@example.com_deleted_**********”に変更する
    deleted_email = user.email + '_deleted_' + Time.current.to_i.to_s
    user.assign_attributes(email: deleted_email, deleted_at: Time.current)

    # 通常メールアドレスが変更されると通知メールが飛ぶので、
    # その通知メールをキャンセルする
    user.skip_email_changed_notification!

    # 保存処理
    user.save
    tops_destroycomp_path
  end
   
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
end
