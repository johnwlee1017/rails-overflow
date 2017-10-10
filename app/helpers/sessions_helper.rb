module SessionsHelper
  def logged_in?
    !!session[:id]
  end
end
