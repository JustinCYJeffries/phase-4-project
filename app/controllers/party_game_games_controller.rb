class PartyGameGamesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        render json: PartyGameGame.all
    end

    def destroy 
        partygame_game = PartyGameGame.find(params[:id])
        partygame_game.destroy
        head :no_content
    end

    def update
        partygame_game = PartyGameGame.find(params[:id])
        partygame_game.update(partygame_game_params)

        render json: partygame_game, status: :accepted
    end

    

    private 

    def bookclub_book_params 
        params.permit(:party_game_id, :game_id, :archived, :status, :current)
    end

    def render_not_found_response
        render json: { error: 'Party Game Not Found' }, status: :not_found
    end
end

