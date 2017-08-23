module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # ||= は変数がnillの場合は代入、それ以外は何もしない。
  end
  
  def logged_in?
    !!current_user
  end
  
end
