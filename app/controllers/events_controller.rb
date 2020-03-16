class EventsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :index

  def index
    @events.order('created_at ASC')
  end

  def show
    @event_data = @event.users_attending(current_user)
    @user_event = current_user ? UserEvent.where(event_id: @event.id, user_id: current_user.id).first : nil
  end
end
