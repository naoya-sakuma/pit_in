module SessionsHelper
  def logged_in?
    current_user.present?
  end

  def check_logged_in
    unless logged_in?
      redirect_to new_user_session_path, notice: 'ログインをしてください。'
    end
  end
end
