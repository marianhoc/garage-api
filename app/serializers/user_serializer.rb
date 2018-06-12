class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :lastname, :birth, :tel, :authentication_token, :email

  has_one :store_owner
  has_one :normal_user
  has_one :dono_estacionamento
  has_one :operador_estacionamento
  has_one :operador_loja
end
