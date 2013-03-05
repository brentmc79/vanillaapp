class User < ActiveRecord::Base
  attr_accessible :email, :image_url, :name, :screen_name, :uid

  has_many :lists
  has_many :tasks, :through => :lists

  def self.create_from_auth_hash(auth)
    create! do |user|
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.screen_name = auth['info']['nickname'] || ""
         user.image_url = auth['info']['image'] || ""
      end
    end
  end

end
