# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events

  validates :start_date, :end_date, presence: true

  def users_attending(user)
    event_data = []
    user_event_list = user ? user_events.exclude_unattend.where.not(user_id: user.id) : user_events.exclude_unattend

    user_event_list.each do |user_event|
      event_data.push({
        user_name: user_event.name,
        gender:    user_event.gender
      })
    end
    event_data
  end

  def attendable?
    start_date > Date.today
  end
end
