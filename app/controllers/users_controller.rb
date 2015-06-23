class UsersController < ApplicationController
  def new
  end

  def edit
    @user = User.find(params[:id])
    @languages = Language.all
  end
end
