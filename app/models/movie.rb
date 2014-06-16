class Movie < ActiveRecord::Base
  before_validation :set_default_description
  validates :movie_title, :year, :director, :description, presence: true


  def set_default_description
    if self[:description] == nil
      self[:description] = 'Not avaliable'
    end
  end
end
