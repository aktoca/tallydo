class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name,  null: false
      t.integer :year
      t.string :creator,  null: false
      t.boolean :ongoing,  default: false

      t.timestamps
    end
  end
end
