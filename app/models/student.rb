class Student < ActiveRecord::Base
  has_secure_password
  has_many :attendances
  has_many :assignments
  def avatar
    Avatar.from_student(self)
  end
  
  def self.in_seat(seat, now=Date.today)
    present(now).where('attendances.seat_number = ?', seat)
  end

  def self.absent(now=Date.today)
    where.not(id: present(now))
  end
  
  def self.present(now=Date.today)
    joins(:attendances).where(attendances: {attended_on: now})
  end
end
