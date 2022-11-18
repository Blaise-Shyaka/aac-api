class Convention < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  # , uniqueness: true
  # validates :title, uniqueness: { message: I18n.t('errors.title_already_exists') }
  validates :theme, presence: true
  has_many :registrations
end
