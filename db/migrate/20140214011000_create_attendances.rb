class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :attended_on
      t.integer :seat_number

      t.timestamps
    end
  end
end
