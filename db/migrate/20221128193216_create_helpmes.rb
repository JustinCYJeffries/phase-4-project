class CreateHelpmes < ActiveRecord::Migration[6.1]
  def change
    create_table :helpmes do |t|
      t.string :question
      t.belongs_to :party_game_game

      t.timestamps
    end
  end
end
