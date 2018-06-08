class OperadorEstacionamento < ApplicationRecord
  belongs_to :user
  belongs_to :estacionamento
end
