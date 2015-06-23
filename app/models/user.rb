class User < ActiveRecord::Base
  def self.find_or_create_from_auth(data)
    user = User.find_or_create_by(uid: data.uid)

    user.name = data.info.name
    user.save
    user
  end
end
