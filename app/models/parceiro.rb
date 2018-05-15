class Parceiro < ApplicationRecord
  belongs_to :user

  validates :nome, presence: true, length: { in: 2..100 }
  validates :cnpj, numericality: true, uniqueness: true, length: { in: 3..15 }
  validates :telefone, presence: true, length: { in: 5..20 }
end
