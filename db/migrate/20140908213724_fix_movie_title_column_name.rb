class FixMovieTitleColumnName < ActiveRecord::Migration
  def change
    rename_column :movies, :movie_title, :title
    rename_column :movies, :director, :author
  end
end
