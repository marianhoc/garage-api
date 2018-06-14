class Vacancy < ApplicationRecord
  belongs_to :estacionamento
  belongs_to :reservation, optional: true
end
