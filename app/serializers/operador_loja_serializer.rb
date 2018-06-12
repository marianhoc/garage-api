class OperadorLojaSerializer < ActiveModel::Serializer
  attributes :id, :cpf
  has_one :loja
  has_one :user
end
