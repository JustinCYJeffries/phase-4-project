class Helpme < ApplicationRecord
    belongs_to :party_game_game
    has_many :comments, dependent: :destroy

    validates :party_game_game_id, {presence: true }
    validates :question, {presence: true }
end
