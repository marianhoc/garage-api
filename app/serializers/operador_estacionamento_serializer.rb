class OperadorEstacionamentoSerializer < ActiveModel::Serializer
  attributes :id, :cpf
  belongs_to :user
  belongs_to :estacionamento
end
