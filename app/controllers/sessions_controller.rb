class SessionsController < ApplicationController
    skip_before_action :authorize, only: :create

    def create 
        user = User.find_by(email: params[:email])

        if user&.authenticate(params[:password])
            session[:user_id] = user.id 
            render json: user, include: ['party_games', 'party_games.users', 'party_games.party_games_games', 'party_games.party_games_games.game', 'party_games.party_games_games.tracker', 'party_games.party_games_games.helpme', 'party_games.party_games_games.helpme.comments'], status: :created
        else
            render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    def destroy 
        session.delete :user_id 
        head :no_content
    end
end