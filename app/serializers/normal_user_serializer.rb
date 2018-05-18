class NormalUserSerializer < ActiveModel::Serializer
  attributes :id, :balance
  belongs_to :user
end
