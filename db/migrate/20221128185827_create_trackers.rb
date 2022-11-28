class CreateTrackers < ActiveRecord::Migration[6.1]
  def change
    create_table :trackers do |t|
      t.bigint "party_game_game_id", null: false
      t.boolean "complete"
      t.text "notes"
      t.index ["party_game_id"], name: "index_goals_on_party_game_game_id"
      t.timestamps
    end
  end
end
