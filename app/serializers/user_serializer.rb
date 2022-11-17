class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :confirmation_token
end
