class CreateGameQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :helpme do |t|
      t.string "question"
      t.integer "chapter"
      t.bigint "party_game_game_id"
      t.index ["party_game_game_id"], name: "index_helpme_on_party_game_game_id"
      t.timestamps
    end
  end
end
