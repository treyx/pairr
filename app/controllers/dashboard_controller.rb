class DashboardController < ApplicationController
  before_action :authorize!, only: [:index]

  def index
  end

  private

  def authorize!
    redirect_to new_user_path unless current_user
  end
end
