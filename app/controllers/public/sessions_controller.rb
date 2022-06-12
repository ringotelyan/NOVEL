# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  def new_guest
    user = User.guest
    sign_in user #ユーザーをログインさせる
    redirect_to public_novels_path, notice: 'ゲストユーザーとしてログインしました。'
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
      redirect_to new_user_registration_path
    else
      flash[:notice] = "項目を入力してください"
    end
  end
end
