class Ranking < ActiveRecord::Base
  belongs_to :doable, polymorphic: true
  belongs_to :list
end
