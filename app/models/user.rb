class User < ApplicationRecord

  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :partner, dependent: :destroy

  has_one :normal_user, dependent: :destroy

  def parceiro?
    return true if self.partner
    false
  end
end
