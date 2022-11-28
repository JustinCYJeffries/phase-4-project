class PartyGame < ApplicationRecord
    validates :name, {presence: true }
    has_many :party_game_users, dependent: :destroy
    has_many :users, through: :party_game_users
    has_many :party_game_games, dependent: :destroy
    has_many :game, through: :party_game_games
end
