class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    find_by_uid(auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["extra"]["username"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end
end