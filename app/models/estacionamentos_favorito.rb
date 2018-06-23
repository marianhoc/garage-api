class EstacionamentosFavorito < ApplicationRecord
  belongs_to :normal_user
  belongs_to :estacionamento
end
