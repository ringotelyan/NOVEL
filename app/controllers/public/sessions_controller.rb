# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    flash[:notice] = 'ゲストユーザーとしてログインしました'
    redirect_to public_novels_path
  end

  protected
  # 退会しているかを判断するメソッド
  def user_state
    ## 【処理内容１】入力されたemailからアカウントを１権取得
    @user = User.find_by(email: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## 【処理内容２】取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      ## 【処理内容３：退会していた場合の処理】
      flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_user_session_path
    else
      flash[:notice] = "項目を入力してください"
    end
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
