class CreateLookSubcategories < ActiveRecord::Migration[7.1]
  def change
    create_table :look_subcategories do |t|
      t.references :subcategory, null: false, foreign_key: true
      t.references :look, null: false, foreign_key: true

      t.timestamps
    end
  end
end
