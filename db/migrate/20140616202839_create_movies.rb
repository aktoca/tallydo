class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :movie_title
      t.string :aka_title
      t.integer :year
      t.string :description
      t.string :director
      t.string :actors , array: true, default: '{}'
      t.string :imdbid
      t.string :poster

      t.timestamps
    end
  end
end
