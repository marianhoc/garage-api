class VacancySerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :estacionamento
  belongs_to :normal_user, optional: true
end
