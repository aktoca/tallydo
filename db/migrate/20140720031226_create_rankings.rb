class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.references :doable, polymorphic: true, index: true
      t.references :list, index: true
      t.integer :rank

      t.timestamps
    end
  end
end
