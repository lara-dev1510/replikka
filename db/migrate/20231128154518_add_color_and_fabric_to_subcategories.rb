class AddColorAndFabricToSubcategories < ActiveRecord::Migration[7.1]
  def change
    add_column :subcategories, :item, :string
    add_column :subcategories, :color, :string
    add_column :subcategories, :fabric, :string
  end
end
