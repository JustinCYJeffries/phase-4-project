class User < ApplicationRecord
    has_secure_password
    validates :email, {presence: true, uniqueness: true}

    has_many :party_game_users, dependent: :destroy
    has_many :party_games, through: :party_game_users
    has_many :comments, dependent: :destroy
end
