class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    def create 
        user = User.create(user_params)

        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def index 
        users = User.all 
        render json: users
    end

    def show 
        user = @current_user
        render json: user, include: include: ['party_games', 'party_games.users', 'party_games.party_games_games', 'party_games.party_games_games.game', 'party_games.party_games_games.tracker', 'party_games.party_games_games.helpme', 'party_games.party_games_games.helpme.comments']
    end

    def update 
        user = @current_user
        user.update(user_params)
        render json: user, include: ['party_games', 'party_games.users', 'party_games.party_games_games', 'party_games.party_games_games.game', 'party_games.party_games_games.tracker', 'party_games.party_games_games.helpme', 'party_games.party_games_games.helpme.comments'], status: :accepted
    end

    def destroy
        @current_user.destroy 
        head :no_content
    end

    private 

    def user_params
        params.permit(:email, :username,  :password, :password_confirmation, :party_games)
    end
end

