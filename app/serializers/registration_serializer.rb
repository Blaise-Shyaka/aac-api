class RegistrationSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :email, :country, :phone_number, :passport_number
  belongs_to :convention
end