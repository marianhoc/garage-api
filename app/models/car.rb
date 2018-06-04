class Car < ApplicationRecord
  belongs_to :normal_user

  validates :placa, uniqueness: true

  after_save :default_car

  private

  def default_car
    normal_user = NormalUser.find(self.normal_user.id)
    normal_user.cars.each do |car|
      car.update_attribute(:active, false) if car != self && self.active?
    end
  end
end
