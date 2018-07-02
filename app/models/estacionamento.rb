class Estacionamento < ApplicationRecord
    belongs_to :dono_estacionamentos, class_name: "DonoEstacionamento"

    has_many :reservations, dependent: :destroy
    has_many :vacancies, dependent: :destroy
    has_many :operador_estacionamentos, dependent: :destroy
    has_many :estacionamentos_favoritos, dependent: :destroy

    validates :nome, presence: true, length: { in: 2..255 }
    validates :endereco, presence: true, length: { in: 10..255 }
    validates :telefone, presence: true, length: { in: 6..20 }, numericality: true, uniqueness: true
    validates :razao_social, presence: true, length: { in: 2..255 }
    validates :cnpj, presence: true, length: { in: 5..50 }, uniqueness: true
    validates :bairro, presence: true, length: { in: 2..255 }
    validates :cidade, presence: true, length: { in: 2..100 }
    validates :estado, presence: true, length: { in: 2..15 }
    validates :agencia, presence: true, length: { in: 2..100 }
    validates :conta, presence: true, length: { in: 2..50 }
    validates :total_vagas, presence: true, length: { in: 1..10000 }

    after_create :set_vagas_ativas

    def aumenta_vagas_ocupadas()
        self.vagas_ativas -= 1
        self.vagas_ocupadas += 1
        self.save
    end

    def diminui_vagas_ocupadas()
        self.vagas_ativas += 1
        self.vagas_ocupadas -= 1
        self.save
    end

    def aumenta_total_vagas()
        if self.update_attribute(:total_vagas, (self.total_vagas + 1) )
            self.update_attribute(:vagas_ativas, (self.vagas_ativas + 1) )
        end
    end

    def diminui_total_vagas()
        if self.total_vagas == 0
            self.errors.add(:total_vagas, "não pode ser menor do que 0")
            return false
        elsif self.total_vagas == self.vagas_ocupadas
            self.errors.add(:total_vagas, "não pode ser menor do que número de vagas ocupadas")
            return false
        elsif self.update_attribute(:total_vagas, (self.total_vagas - 1) )
            self.update_attribute(:vagas_ativas, (self.vagas_ativas - 1) )
        end
    end

    # para funcionar dessa forma, todo estacionamento deve ao ser criado, 
    # já possuir um número de reservas do paremais pré-determinado ou zero
    def set_vagas_ativas()
        self.update_attribute(:vagas_ativas, self.total_vagas)
    end
end
