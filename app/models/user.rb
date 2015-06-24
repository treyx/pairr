class User < ActiveRecord::Base
  has_many :languages, through: :user_languages
  has_many :user_languages
  validates :about, length: { maximum: 500 }

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(uid: data.uid)

    user.name      = data.info.name
    user.image_url = data.info.image
    user.username  = data.info.nickname
    user.save
    user
  end

  def available_matches
    User.where.not(id: match_restrictions)
  end

  def pending_approvals
    User.where(id: half_approved_matches)
  end

  def match_restrictions
    restricted_ids = []
    restricted_ids << current_user_id
    restricted_ids << pending_matches_as_initiator
    restricted_ids << pending_matches_as_invitee
    restricted_ids << rejected_matches_as_initiator
    restricted_ids << rejected_matches_as_invitee
    restricted_ids << approved_matches_as_initiator
    restricted_ids << approved_matches_as_invitee
    restricted_ids.flatten.uniq
  end

  def half_approved_matches
    half_approved = []
    half_approved << pending_matches_as_invitee
    half_approved.flatten.uniq
  end

  private

  def current_user_id
    self.id
  end

  def pending_matches_as_initiator
    matches = UserMatch.where(initiator_id: self.id, match_status: "pending")
    matches.pluck("initiator_id", "invitee_id")
  end

  def pending_matches_as_invitee
    matches = UserMatch.where(invitee_id: self.id, match_status: "pending")
    matches.pluck("initiator_id")
  end

  def rejected_matches_as_initiator
    matches = UserMatch.where(initiator_id: self.id, match_status: "rejected")
    matches.pluck("initiator_id", "invitee_id")
  end

  def rejected_matches_as_invitee
    matches = UserMatch.where(invitee_id: self.id, match_status: "rejected")
    matches.pluck("initiator_id", "invitee_id")
  end

  def approved_matches_as_initiator
    matches = UserMatch.where(initiator_id: self.id, match_status: "approved")
    matches.pluck("initiator_id", "invitee_id")
  end

  def approved_matches_as_invitee
    matches = UserMatch.where(invitee_id: self.id, match_status: "approved")
    matches.pluck("initiator_id", "invitee_id")
  end
end
