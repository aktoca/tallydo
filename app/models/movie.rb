class Movie < ActiveRecord::Base
  before_validation :set_default_description
  validates :movie_title, :year, :director, :description, presence: true

end
