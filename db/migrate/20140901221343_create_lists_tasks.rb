class CreateListsTasks < ActiveRecord::Migration
  def change
    create_table :lists_tasks, id: false do |t|
      t.integer :list_id
      t.integer :task_id
    end
  end
end
