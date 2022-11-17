class UserRegistrationSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :confirmation_token
end