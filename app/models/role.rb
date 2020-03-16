class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def self.admin
    where(name: 'admin')
  end

  def self.guest
    where(name: 'guest')
  end
end
