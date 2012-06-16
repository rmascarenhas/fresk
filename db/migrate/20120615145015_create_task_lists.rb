class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.string  :name,            null: false
      t.boolean :public,          default: true
      t.integer :tasks_count,     default: 0

      t.timestamps
    end
  end
end
