class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # flash[:notice] = 'Logged in successfully.'
      login(@user)
      redirect_to questions_path
    else
      # flash[:alert] = @user.errors.full_messages
      render :new
    end
  end

  def show

  end

  def edit
    @user = User.find(session[:id])
  end

  def update
    @user = User.find(session[:id])
    if params[:password] && @user.update(user_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
