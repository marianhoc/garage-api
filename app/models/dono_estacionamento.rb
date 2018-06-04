class DonoEstacionamento < ApplicationRecord
  belongs_to :user



  has_many :estacionamentos, foreign_key: "dono_estacionamentos_id",  dependent: :destroy

end
