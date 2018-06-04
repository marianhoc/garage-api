class Estacionamento < ApplicationRecord
    belongs_to :dono_estacionamentos, class_name: DonoEstacionamento

    has_many :reservations, dependent: :destroy
    has_many :vacancies, dependent: :destroy

    validates :nome, presence: true, length: { in: 2..255 }
    validates :endereco, presence: true, length: { in: 10..255 }
    validates :telefone, presence: true, length: { in: 6..20 }, numericality: true, uniqueness: true
    validates :razao_social, presence: true, length: { in: 2..255 }
    validates :cnpj, presence: true, length: { in: 5..50 }, uniqueness: true
end
