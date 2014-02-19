class StudentIdToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :student_id, :string
  end
end
