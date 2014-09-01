class List < ActiveRecord::Base
  validates :name, :year, :creator, presence: true

  has_many :rankings 
  has_many :movies, through: :rankings, source: :doable, source_type: "Movie" 
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tasks
  
end
