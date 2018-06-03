class CardSerializer < ActiveModel::Serializer
  attributes :id, :numero, :titular
  has_one :user
end
