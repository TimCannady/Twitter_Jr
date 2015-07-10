class User < ActiveRecord::Base
  include BCrypt

  has_many :tweets
  has_many :leader_relationships, class_name: 'UserRelationship', foreign_key: 'minion_id'
  has_many :leaders, through: :minion_relationships, source: :minion

  has_many :minion_relationships, class_name: 'UserRelationship', foreign_key: 'leader_id'
  has_many :minions, through: :leader_relationships, source: :leader

  # has_many :minion_tweets, through: :minions, source: :tweets

  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

