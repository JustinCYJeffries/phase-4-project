class CreatePartyGameUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :party_game_users do |t|

      t.boolean :isAdmin
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :[party_game], null: false, foreign_key: true
      t.timestamps
    end
  end
end
