class Reservation < ApplicationRecord
  belongs_to :normal_user
  belongs_to :estacionamento
  belongs_to :car
end
