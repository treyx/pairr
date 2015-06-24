class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :next_possibility

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def next_possibility
    @next_possibility ||= current_user.available_matches.sample
  end
end
