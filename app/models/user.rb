class User < ApplicationRecord
  has_secure_password
  has_one :student_profile, dependent: :destroy
  has_one :company_profile, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  
end
