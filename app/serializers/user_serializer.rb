class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :lastname, :birth, :tel, :authentication_token, :email

  has_one :store_owner

  has_one :normal_user
end
