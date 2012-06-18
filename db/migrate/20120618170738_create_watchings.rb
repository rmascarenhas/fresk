class CreateWatchings < ActiveRecord::Migration
  def change
    create_table :watchings do |t|
      t.references :user,      null: false
      t.references :task_list, null: false

      t.timestamps
    end
    add_index :watchings, :user_id
    add_index :watchings, :task_list_id
  end
end
