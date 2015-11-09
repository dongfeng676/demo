class Student < ActiveRecord::Base
  belongs_to :teacher
  has_one :computer
end
