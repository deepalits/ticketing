class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :coupon, foreign_key: true
      t.references :user_event, foreign_key: true
    	t.float      :amount
      t.float			 :discount
      t.integer    :status
      t.timestamps
    end
  end
end
