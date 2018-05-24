class NormalUserSerializer < ActiveModel::Serializer
  attributes :id, :balance, :placa, :cpf
  belongs_to :user
end
