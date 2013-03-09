class Task < ActiveRecord::Base
  attr_accessible :complete, :description, :list_id, :notes, :position

  scope :ordered, order("position ASC, updated_at DESC")

  belongs_to :list

  before_create :init_position
  after_update :reposition_tasks

  private

  def init_position
    if list
      self.position = list.tasks.count
    end
  end

  def reposition_tasks
    if list.tasks.reload.where("position = #{position} AND id != #{id}").count > 0
      Task.transaction do
        list.tasks.ordered.each_with_index do |task, index|
          unless task.position == index
            task.update_attribute(:position, index)
          end
        end
      end
    end
  end
end
