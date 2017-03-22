class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザーのプロフィールにリダイレクト
      log_in user
      redirect_to user
    else
      # エラーメッセージを作成
      render 'new'
    end
  end

  def destroy
  end
end
