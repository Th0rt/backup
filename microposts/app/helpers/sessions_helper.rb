module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # ||= は変数がnillの場合は代入、それ以外は何もしない。
  end
  
  def logged_in?
    !!current_user
    # '!'は否定を表す論理演算子。
    # Rubyではnillとfalse以外は全てtrueとして扱われる。
    # '!!'は二重否定なので論理上は何の変化もないが、
    # 出力をtrue/falseに変換することが出来る。
  end
  
end
