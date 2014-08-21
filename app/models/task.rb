class Task < ActiveRecord::Base
  scope :todo,-> { where(done: false)}
  scope :tallied,-> { where(done: true)}
  scope :mine, lambda {|user| where(user_id: user.id)}
  scope :by_doable,lambda {|type|where(doable_type: type)}
  scope :percent_done, lambda {|user| (mine(user).tallied.length / mine(user).length) * 100} 

  belongs_to :doable, polymorphic: true
  belongs_to :movie, -> { where(movies: {doable_type: 'Movie' }) }, foreign_key: 'doable_id'
  belongs_to :user


end
