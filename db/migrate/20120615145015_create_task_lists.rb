class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.string  :name,   null: false
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
