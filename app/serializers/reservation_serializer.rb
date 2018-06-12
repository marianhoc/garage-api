class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :status, :car_at_vacancy, 
    :programming_date_begin, :programming_date_end,
    :expected_time_at_vacancy, 
    :real_time_at_vacancy, :total_value, 
    :payment, :creditos_pare_mais,
    :estacionamento_hora, :estacionamento_primeira_hora,
    :estacionamento_taxa

  belongs_to :normal_user
  belongs_to :estacionamento
  belongs_to :car
end
