class AddStoreOwnerToLojas < ActiveRecord::Migration[5.1]
  def change
    add_reference :lojas, :store_owner, foreign_key: true
  end
end
