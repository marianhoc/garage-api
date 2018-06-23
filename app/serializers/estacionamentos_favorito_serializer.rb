class EstacionamentosFavoritoSerializer < ActiveModel::Serializer
  attributes :id
  has_one :normal_user
  has_one :estacionamento
end
