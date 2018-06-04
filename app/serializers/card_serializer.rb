class CardSerializer < ActiveModel::Serializer
  attributes :id, :numero, :titular

  #has_one :user
  belongs_to :normal_user, optional: true


end
