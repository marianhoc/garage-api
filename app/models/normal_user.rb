class NormalUser < ApplicationRecord
  belongs_to :user

  has_many :credits, dependent: :destroy

  def add_credits(valor = 0)
    if valor.to_i <= 0
      errors[:base] << "Insira um valor válido."
      return false
    end
    credits = self.credits.build(value: valor.to_i)
    if credits.save
      return credits
    else
      errors[:base] << "Houve um erro ao processar sua transação, tente novamente."
      errors[:base] << credits.errors.full_messages
      return false
    end
  end
end
