class StoreOwner < ApplicationRecord
  belongs_to :user
  has_many :lojas
end
