class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    @user = User.find_or_create_from_auth(auth)
    if new_user?
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    elsif @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged In"
    else
      redirect_to new_user_path, notice: "Invalid"
    end
  end

  private

  def new_user?
    @user && @user.about == nil
  end
end
