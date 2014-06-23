class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.references :doable, polymorphic: true, null: false
      t.boolean :done, null: false, default: false
      t.string :notes

      t.timestamps
    end
  end
end
