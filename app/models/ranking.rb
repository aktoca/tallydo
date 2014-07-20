class Ranking < ActiveRecord::Base
  validates :doable_id, :doable_type, :list_id, presence: true 

  belongs_to :doable, polymorphic: true
  belongs_to :list

end
