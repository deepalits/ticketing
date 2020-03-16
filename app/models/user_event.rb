class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :orders
  enum status: { attend: 0, unattend: 1 }

  delegate :name, :gender, to: :user

  scope :exclude_unattend, -> { where('status != ?', statuses['unattend']) }

  def reverse_status
    status == 'attend' ? 'unattend' : 'attend'
  end
end
