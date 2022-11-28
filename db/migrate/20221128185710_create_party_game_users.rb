class CreatePartyGameUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :party_game_users do |t|
      t.bigint "user_id", null: false
      t.bigint "party_game_id", null: false
      t.boolean "isAdmin"
      t.index ["party_game_id"], name: "index_party_game_users_on_party_game_id"
      t.index ["user_id"], name: "index_party_game_users_on_user_id"
      t.timestamps
    end
  end
end
