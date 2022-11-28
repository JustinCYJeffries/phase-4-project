class PartyGameGame < ApplicationRecord
    belongs_to :party_game
  belongs_to :game
  has_many :tracker, dependent: :destroy
  has_many :guide_questions, dependent: :destroy

  validates :game_id, {presence: true }
  validates :party_game_id, {presence: true }
  validates :status, inclusion: { in: ['Not Started', 'In Progress', 'Finished']}
end
