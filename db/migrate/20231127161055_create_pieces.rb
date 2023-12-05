class CreatePieces < ActiveRecord::Migration[7.1]
  def change
    create_table :pieces do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true
      t.integer :worn_stat, default: 0

      t.timestamps
    end
  end
end
