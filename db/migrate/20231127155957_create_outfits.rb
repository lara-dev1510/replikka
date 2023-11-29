class CreateOutfits < ActiveRecord::Migration[7.1]
  def change
    create_table :outfits do |t|
      t.boolean :confirmed
      t.references :look, null: false, foreign_key: true
      t.timestamps
    end
  end
end
