class NormalUser < ApplicationRecord
  belongs_to :user

  has_many :credits, dependent: :destroy
end
