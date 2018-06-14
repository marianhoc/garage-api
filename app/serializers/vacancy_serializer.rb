class VacancySerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :estacionamento
  belongs_to :reservation, optional: true
end
