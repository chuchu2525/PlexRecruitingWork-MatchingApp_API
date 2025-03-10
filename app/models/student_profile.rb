class StudentProfile < ApplicationRecord
  belongs_to :user
  has_many :applications
  has_many :companies, through: :applications
end
