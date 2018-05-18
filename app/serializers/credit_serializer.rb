class CreditSerializer < ActiveModel::Serializer
  attributes :id, :value
  belongs_to :normal_user
end
