class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, :email, presence: true

  validates :email, uniqueness: true

  has_many :tasks
  has_many :movies, through: :tasks, source: :doable, source_type: "Movie"

end
