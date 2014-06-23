class Movie < ActiveRecord::Base
  validates :movie_title, :year, :director, presence: true

end
