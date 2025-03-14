class CompanyProfile < ApplicationRecord
  belongs_to :user
  has_many :recruitments
  
  def name
    user.name
  end
end
