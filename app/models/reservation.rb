class Reservation < ApplicationRecord
  belongs_to :normal_user
  belongs_to :estacionamento
  belongs_to :car

  has_one :vacancy, dependent: :nullify

  enum status: [:pendente, :ocupado, :atrasado, :cancelado, :confirmado, :checkout]

  def set_programming_date_end
    self.programming_date_end = 
      self.programming_date_begin + self.expected_time_at_vacancy.hours
  end

  def change_status(status)
    if status == :confirmado
      self.update_attribute(:status, status)
    elsif status == :ocupado
      if self.estacionamento.vagas_ocupadas < self.estacionamento.vagas_ativas
        v = self.estacionamento.vacancies.where(reservation_id: nil).first
        if v.update_attribute(:reservation_id, self.id)
          self.estacionamento.aumenta_vagas_ocupadas()
          self.update_attribute(:status, status)
        end
      else
        errors[:base] << "Estacionamento cheio"
      end
    elsif status == :cancelado
      if self.status == :pendente
        self.update_attribute(:status, status)
      else
        v = self.vacancy
        if v && v.update_attribute(:reservation_id, nil)
          self.estacionamento.diminui_vagas_ocupadas()
        end
        self.update_attribute(:status, status)
      end
    else
      return false
    end
  end

  def checkout
    self.vacancy.update_attribute(:reservation_id, nil)
    self.estacionamento.diminui_vagas_ocupadas()
    self.update_attribute(:status, :checkout)
  end
end
