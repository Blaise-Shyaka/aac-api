class ConventionSerializer
  include JSONAPI::Serializer

  attributes :title, :theme, :active
  belongs_to :user, serializer: UserLoginSerializer
end