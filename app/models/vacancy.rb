class Vacancy < ApplicationRecord
  belongs_to :estacionamento
  belongs_to :normal_user, optional: true
end
