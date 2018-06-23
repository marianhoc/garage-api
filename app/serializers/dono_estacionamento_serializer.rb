class DonoEstacionamentoSerializer < ActiveModel::Serializer
  attributes :id, :cpf
  belongs_to :user

  has_many :estacionamentos
end
