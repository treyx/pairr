class UserMatchesController < ApplicationController

  def create
    if params[:status]
      UserMatch.create(initiator_id: current_user.id, invitee_id: params[:invitee_id], match_status: params[:status] )
    else
      UserMatch.create(initiator_id: current_user.id, invitee_id: params[:invitee_id])
    end
    redirect_to matches_path
  end
end
