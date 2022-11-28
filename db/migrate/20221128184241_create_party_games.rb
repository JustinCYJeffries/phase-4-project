class CreatePartyGames < ActiveRecord::Migration[6.1]
  def change
    create_table :party_games do |t|
      t.string :name
      t.string "name"
      t.timestamps
    end
  end
end
