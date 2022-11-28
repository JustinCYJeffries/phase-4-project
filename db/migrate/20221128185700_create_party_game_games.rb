class CreatePartyGameGames < ActiveRecord::Migration[6.1]
  def change
    create_table :party_game_games do |t|
    t.bigint "party_games_id", null: false
    t.bigint "games_id", null: false
    t.boolean "archived"
    t.string "status"
    t.text "suggested_by"
    t.boolean "current"
    t.index ["game_id"], name: "index_party_game_game_on_game_id"
    t.index ["party_game_id"], name: "index_party_game_games_on_party_game_id"
      t.timestamps
    end
  end
end
