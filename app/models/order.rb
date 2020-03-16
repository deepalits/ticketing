class Order < ApplicationRecord
  belongs_to :user_event

  enum status: { success: 0, failure: 1 }

  after_commit :update_user_event_status, if: -> { saved_change_to_status? }

  def update_user_event_status
    UserEvent.where(id: user_event_id).first.update(status: UserEvent.statuses['attend'])
  end
end
