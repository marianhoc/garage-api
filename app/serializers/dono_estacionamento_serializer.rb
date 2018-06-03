class DonoEstacionamentoSerializer < ActiveModel::Serializer
  attributes :id, :cpf
  belongs_to :user
end
