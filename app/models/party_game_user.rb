class PartyGameUser < ApplicationRecord
    belongs_to :user
    belongs_to :party_game
  
    validates :user_id, {presence: true }
    validates :party_game_id, {presence: true }
end
