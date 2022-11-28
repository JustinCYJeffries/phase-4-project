class Game < ApplicationRecord
    validates :title, {presence: true }
    validates :publisher, {presence: true }
    validates :imageURL, {presence: true }
    validates :description, {presence: true }

    has_many :party_game_games, dependent: :destroy
    has_many :party_games, through: :party_game_games 
end
