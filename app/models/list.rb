class List < ActiveRecord::Base
  validates :name, :year, :creator, presence: true

  has_many :rankings 
  has_many :movies, through: :rankings
  has_and_belongs_to_many :users
  
end
