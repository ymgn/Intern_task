module SessionsHelper

  # 渡されたユーザーでログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す(存在する場合)
  def current_user  
    @current_user ||= User.find(session[:user_id])
  end

  # ユーザーがログインしている場合はtrue　その他はfalse
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
