class Attendance < ActiveRecord::Base
  belongs_to :student
  validates_presence_of :seat_number
  validates :seat_number, :numericality => {:only_integer => true}
end
