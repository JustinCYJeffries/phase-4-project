class GamesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_game, only: [:show, :update, :destroy]

    def create 
        game = Game.create(game_params)

        party_game_game = game.party_game_game.create(party_game_game_params)
        party_game_game.archived = false
        party_game_game.current = false
        party_game_game.save

        render json: game, status: :created
    end

    def show 
        game = @game
        render json: game
    end

    def destroy 
        @game.destroy
        head :no_content
    end

   



    private 

    def game_params
        params.permit(:title, :publisher, :releaseDate, :imageURL, :genres => [])
    end

    def party_game_game_params
        params.permit(:party_game_id, :status, :archived, :current)
    end

    def set_game
        @game = Game.find(params[:id])
    end

    def render_not_found_response
        render json: { error: 'Game Not Found' }, status: :not_found
    end
end

end
