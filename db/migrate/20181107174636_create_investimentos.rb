class CreateInvestimentos < ActiveRecord::Migration[5.0]
  def change
    create_table :investimentos do |t|
      t.string :name
      t.integer :nivel
      t.decimal :price
      t.decimal :gain

      t.timestamps
    end
  end
end
