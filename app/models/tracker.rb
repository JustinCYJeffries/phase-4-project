class Tracker < ApplicationRecord
    belongs_to :party_game_game

    validates :party_game_game_id, {presence: true }
    validates :deadline, {presence: true }
    
    
end
