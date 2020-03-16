class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string    :name, null: false
      t.float     :fee
      t.text      :description
      t.datetime  :start_date, null: false
      t.datetime  :end_date, null: false
      t.timestamps
    end
  end
end
