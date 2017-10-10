class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login(user)
    session[:id] = user.id
  end
end
