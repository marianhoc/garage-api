class AddNotaFiscalToCredits < ActiveRecord::Migration[5.1]
  def change
    add_column :credits, :nota_fiscal, :string
  end
end
