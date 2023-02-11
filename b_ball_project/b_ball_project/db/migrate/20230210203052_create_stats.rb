class CreateStats < ActiveRecord::Migration[7.0]
  def change
    create_table :stats do |t|
      t.integer :points
      t.integer :assists
      t.integer :rebounds
      t.integer :steals

      t.timestamps
    end
  end
end
