class List < ActiveRecord::Base
  attr_accessible :name, :order, :user_id

  has_many :tasks
  belongs_to :user

end
