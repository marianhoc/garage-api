class User < ApplicationRecord

  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :store_owner, dependent: :destroy
  has_one :dono_estacionamento, dependent: :destroy
  has_one :normal_user, dependent: :destroy
  has_one :operador_estacionamento, dependent: :destroy
  has_one :operador_loja, dependent: :destroy
  has_one :admin, dependent: :destroy

  def parceiro?
    return true if self.partner
    false
  end
end
