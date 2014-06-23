class Movie < ActiveRecord::Base
  validates :movie_title, :year, :director, presence: true

  has_many :tasks, as: :doable
  has_many :users, through: :tasks 

  
end
