class UserMatchesController < ApplicationController

  def create
    already_match = UserMatch.where(initiator_id: current_user.id, invitee_id: params[:invitee_id]).first || UserMatch.where(invitee_id: current_user.id, initiator_id: params[:invitee_id]).first

    if !already_match
      if params[:status]
        UserMatch.create(initiator_id: current_user.id, invitee_id: params[:invitee_id], match_status: params[:status] )
      else
        UserMatch.create(initiator_id: current_user.id, invitee_id: params[:invitee_id])
      end
    elsif already_match.match_status == "pending"
      already_match.update(match_status: "approved")
      flash[:success] = "Congrats! You have a match"
    else
      already_match.update(match_status: "rejected")
    end
    redirect_to matches_path
  end
end
