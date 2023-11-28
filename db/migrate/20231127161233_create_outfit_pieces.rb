class CreateOutfitPieces < ActiveRecord::Migration[7.1]
  def change
    create_table :outfit_pieces do |t|
      t.references :outfit, null: false, foreign_key: true
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
