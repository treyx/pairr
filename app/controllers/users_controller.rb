class UsersController < ApplicationController
  def new
  end

  def edit
    @user = User.find(params[:id])
    @languages = Language.all
  end

  def update
    current_user.update(about: params[:user][:about])

    languages.each do |id|
      UserLanguage.create(user_id: current_user.id, language_id: id)
    end

    redirect_to root_path
  end

  private

  def languages
    params[:user][:languages].shift
    params[:user][:languages]
  end
end
