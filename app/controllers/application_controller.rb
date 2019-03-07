class ApplicationController < ActionController::Base

  private

  def current_user
  if session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
 end

def logged_in?
    !!current_user
end

  def require_login
    if !logged_in?
      redirect_to root_path # halts request cycle
    end
  end

end
