class Reservation < ApplicationRecord
  belongs_to :normal_user
  belongs_to :estacionamento
  belongs_to :car

  def set_programming_date_end
    self.programming_date_end = 
      self.programming_date_begin + self.expected_time_at_vacancy.hours
    self.save
  end
end
