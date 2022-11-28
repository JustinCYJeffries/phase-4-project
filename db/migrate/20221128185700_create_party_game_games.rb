class CreatePartyGameGames < ActiveRecord::Migration[6.1]
  def change
    create_table :party_game_games do |t|
      t.belongs_to :party_game, null: false, foreign_key: true, array:true
      t.belongs_to :game, null: false, foreign_key: true
   
      t.string :status

      t.timestamps
    end
  end
end
