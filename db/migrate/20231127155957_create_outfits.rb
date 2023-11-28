class CreateOutfits < ActiveRecord::Migration[7.1]
  def change
    create_table :outfits do |t|
      t.boolean :confirmed

      t.timestamps
    end
  end
end
