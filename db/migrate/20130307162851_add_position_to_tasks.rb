class AddPositionToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :position, :integer

    Task.reset_column_information

    List.all.each do |list|
      list.tasks.order("created_at desc").each_with_index do |task, index|
        task.update_attribute(:position, index)
      end
    end
  end
end

class Task < ActiveRecord::Base
end
