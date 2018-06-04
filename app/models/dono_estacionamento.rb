class DonoEstacionamento < ApplicationRecord
  belongs_to :user



  has_many :estacionamento

end
