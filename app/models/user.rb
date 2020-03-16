class User < ApplicationRecord
  has_secure_password
  validates :email, :name, presence: true, uniqueness: true
  belongs_to :role
  has_many :user_events
  has_many :events, through: :user_events

  enum gender: { female: 0, male: 1 }
end
