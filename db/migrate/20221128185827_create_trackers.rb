class CreateTrackers < ActiveRecord::Migration[6.1]
  def change
    create_table :trackers do |t|
      t.belongs_to :party_game_game, null: false, foreign_key: true
  
      t.boolean :complete
      t.timestamps
    end
  end
end
