class User < ActiveRecord::Base
  has_many :languages, through: :user_languages
  has_many :user_languages
  validates :about, length: { maximum: 500 }

  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(uid: data.uid)

    user.name = data.info.name
    user.save
    user
  end
end
