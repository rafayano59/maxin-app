class AddDataretiradaToInvestimentos < ActiveRecord::Migration[5.0]
  def change
    add_column :investimentos, :dataretirada, :datetime
  end
end
