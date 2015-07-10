
class UserRelationship < ActiveRecord::Base

  belongs_to :leader, class_name: "User"
  belongs_to :minion, class_name: "User"

  # shephard /follower / stalker_id
  validates :leader, presence: true

  # sheep / followee / prey_id
  validates :stalker, presence: true

end
