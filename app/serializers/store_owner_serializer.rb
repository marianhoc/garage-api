class StoreOwnerSerializer < ActiveModel::Serializer
  attributes :id, :cpf
  belongs_to :user

  has_many :lojas
end
