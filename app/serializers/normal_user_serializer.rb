class NormalUserSerializer < ActiveModel::Serializer
  attributes :id, :points
  belongs_to :user
end
