class Reservation < ApplicationRecord
  belongs_to :normal_user
  belongs_to :estacionamento
end
