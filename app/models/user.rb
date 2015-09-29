class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  has_many :owned_errands, dependent: :destroy, class_name: :errand
  has_many :accepted_errands, dependent: :nullify, class_name: :errand
  # Next 2 lines linke FriendA->FriendB
  has_many :friendships
  has_many :friends, through: :friendships
  # Next 2 lines required to link FriendB->FriendA
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :friendships, source: :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
