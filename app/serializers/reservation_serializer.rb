class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :status, :car_at_vacancy, :programming_date, :time_at_vacancy, :tax_value, :total_value
  belongs_to :normal_user
  belongs_to :estacionamento
  belongs_to :car
end
