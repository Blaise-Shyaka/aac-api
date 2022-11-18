class UserLoginSerializer
  include JSONAPI::Serializer
  attributes :id, :email
end
