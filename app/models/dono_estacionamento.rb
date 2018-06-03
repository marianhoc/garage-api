class DonoEstacionamento < ApplicationRecord
  belongs_to :user



  has_many :estacionamentos

end
