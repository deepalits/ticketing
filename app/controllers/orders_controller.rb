class OrdersController < ApplicationController
  load_and_authorize_resource :user_event
  load_and_authorize_resource :order, through: :user_event

  def new
    coupon = Coupon.applicable_coupons(current_user)
    fee = Event.where(id: @user_event.event_id).first.fee
    if coupon
      @order.coupon_id = coupon.id
      @order.discount = fee * coupon.discount.to_f * 0.01
    end
    @order.amount = fee - @order&.discount.to_f
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to event_path(@user_event.event_id), notice: 'Payment successful'
    else
      redirect_to new, notice: 'Payment failed, please try again'
    end
  end

  private

  def order_params
    params.permit(:status, :user_event_id, :id, :discount, :amount, :coupon_id)
  end
end
