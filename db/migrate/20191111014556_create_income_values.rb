class CreateIncomeValues < ActiveRecord::Migration[6.0]
  def change
    create_table :income_values do |t|
      t.integer :title, null: false
      t.date :year_month, null: false
      t.integer :value, null: false
      t.string :description
      t.timestamps
    end
  end
end
