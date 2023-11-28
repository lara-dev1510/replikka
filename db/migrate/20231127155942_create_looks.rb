class CreateLooks < ActiveRecord::Migration[7.1]
  def change
    create_table :looks do |t|

      t.timestamps
    end
  end
end
