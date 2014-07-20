class List < ActiveRecord::Base
  validates :name, :year, :creator, presence: true

  has_many :rankings, as :doable
  has_many :movies, through: :rankings
  
end
