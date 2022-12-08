class YouthCampRegistration < ApplicationRecord
  validates_presence_of :full_name, :birth_date, :sex
  belongs_to :registration
end
