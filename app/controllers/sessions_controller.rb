class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.authenticate(login_params)
    if @user
      login(@user)
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def destroy
    session[:id] = nil
    redirect_to questions_path
  end

  private
  def login_params
    params.require(:session).permit(:email, :password)
  end
end
