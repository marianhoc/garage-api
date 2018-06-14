class Reservation < ApplicationRecord
  belongs_to :normal_user
  belongs_to :estacionamento
  belongs_to :car

  has_one :vacancy, dependent: :nullify

  def set_programming_date_end
    self.programming_date_end = 
      self.programming_date_begin + self.expected_time_at_vacancy.hours
  end
end
