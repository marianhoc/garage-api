class NormalUserSerializer < ActiveModel::Serializer
  attributes :id, :balance, :placa, :cpf
  belongs_to :user
  has_many :cars
  has_many :estacionamentos_favoritos
end
