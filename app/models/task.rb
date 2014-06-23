class Task < ActiveRecord::Base
  belongs_to :doable, polymorphic: true
  belongs_to :user
end
