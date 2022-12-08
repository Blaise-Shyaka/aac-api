class Registration < ApplicationRecord
  validates_presence_of :first_name, :last_name, :country, :phone_number, :passport_number, :email
  validates_format_of :email, :with => Devise.email_regexp
  validates :email, uniqueness: true
  belongs_to :convention
  has_many :youth_camp_registrations, dependent: :destroy
end
