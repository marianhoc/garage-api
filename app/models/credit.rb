class Credit < ApplicationRecord
  belongs_to :normal_user

  after_create :update_user_credits

  def update_user_credits
    if self.normal_user.update_attribute(:balance, (self.normal_user.balance + self.value))
    else
      errors[:base] << "Erro ao processar a transação."
      self.destroy
    end
  end
end
