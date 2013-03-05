class Task < ActiveRecord::Base
  attr_accessible :complete, :description, :list_id, :notes

  scope :ordered, order("id ASC")
end
