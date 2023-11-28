class CreateSubcategories < ActiveRecord::Migration[7.1]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.integer :temperature_range
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
