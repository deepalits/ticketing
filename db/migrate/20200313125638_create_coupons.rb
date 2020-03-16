class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string  :name
    	t.text    :description
      t.json    :constraints
      t.float   :discount
      t.integer :discount_type
    	t.boolean :is_active, default: false
      t.timestamps
    end
  end
end
