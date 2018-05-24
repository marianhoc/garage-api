class LojaSerializer < ActiveModel::Serializer
  attributes :id, :nome, :endereco, :latitude, :longitude, :cnpj
  belongs_to :store_owner
end
