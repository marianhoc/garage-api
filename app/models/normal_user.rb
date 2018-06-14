class NormalUser < ApplicationRecord
  belongs_to :user

  has_many :credits, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :cards, dependent: :destroy


  def add_credits(valor = 0, nota_fiscal = "")
    if valor.to_i <= 0
      errors[:base] << "Insira um valor válido."
      return false
    end
    credits = self.credits.build(value: valor.to_i, nota_fiscal: nota_fiscal)
    if credits.save
      return credits
    else
      errors[:base] << "Houve um erro ao processar sua transação, tente novamente."
      errors[:base] << credits.errors.full_messages
      return false
    end
  end


  def register_car()


  end


end
