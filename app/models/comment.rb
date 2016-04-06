class Comment < ActiveRecord::Base
  has_reputation :votes, source: :user, aggregated_by: :sum
  belongs_to :user
  
  belongs_to :lesson
  
end
