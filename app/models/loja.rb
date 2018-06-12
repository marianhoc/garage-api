class Loja < ApplicationRecord
  belongs_to :store_owner

  has_many :operador_loja
end
