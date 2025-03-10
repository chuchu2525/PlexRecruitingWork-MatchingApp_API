class CompanyProfile < ApplicationRecord
  belongs_to :user
  has_many :recruitments
end
