class Student < ActiveRecord::Base
  has_secure_password
  has_many :attendances
  def avatar
    Avatar.from_student(self)
  end
end
