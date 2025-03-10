class Application < ApplicationRecord
  belongs_to :student_profile
  belongs_to :recruitment
  has_many :messages
end
