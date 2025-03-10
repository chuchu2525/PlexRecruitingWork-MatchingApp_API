class Recruitment < ApplicationRecord
  belongs_to :company_profile
  has_many :applications
  has_many :student_profiles, through: :applications
end
