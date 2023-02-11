class CreateSponsorships < ActiveRecord::Migration[7.0]
  def change
    create_table :sponsorships do |t|
      t.string :name
      t.integer :player_id

      t.timestamps
    end
  end
end
