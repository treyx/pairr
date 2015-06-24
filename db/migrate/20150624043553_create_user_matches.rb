class CreateUserMatches < ActiveRecord::Migration
  def change
    create_table :user_matches do |t|
      t.integer :initiator_id
      t.integer :invitee_id
      t.string :match_status, default: "pending"
    end
  end
end
