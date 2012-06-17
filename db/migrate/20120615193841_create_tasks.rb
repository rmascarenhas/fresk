class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :task_list
      t.string :description, limit: 140
      t.date :deadline

      t.timestamps
    end
    add_index :tasks, :task_list_id
  end
end
