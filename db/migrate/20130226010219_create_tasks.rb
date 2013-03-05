class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.string :description
      t.text :notes
      t.boolean :complete

      t.timestamps
    end
  end
end
