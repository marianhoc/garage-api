class OperadorLojaSerializer < ActiveModel::Serializer
  attributes :id, :cpf
  belongs_to :loja
  belongs_to :user
end
