class UserEventsController < ApplicationController
  load_and_authorize_resource :event
  load_and_authorize_resource :user_event, through: :event

  def update
    @user_event.update(user_event_params)
    redirect_to event_path(@event), notice: 'Details updated'
  end

  def create
    @user_event.user = current_user
    @user_event.status = nil
    if @user_event.save
      redirect_to new_user_event_order_path(@user_event)
    else
      redirect_to event_path(@event), notice: 'User Event creation failed.'
    end
  end

  def new
    redirect_to new_user_event_order_path(@user_event)
  end

  private

  def user_event_params
    params.permit(:status, :event_id, :id)
  end
end
