class Ranking < ActiveRecord::Base
  validates :doable_id, :doable_type, :list_id, presence: true 

  belongs_to :doable, polymorphic: true
  belongs_to :movie, -> { where(movies: {doable_type: 'Movie' }) }, foreign_key: 'doable_id'
  belongs_to :list


end
