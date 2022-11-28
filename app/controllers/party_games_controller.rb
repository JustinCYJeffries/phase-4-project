class PartyGamesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_party_game, only: [:show, :destroy]
    skip_before_action :authorize, only: [:index, :show]

    def index 
        partygames = PartyGame.all 
        render json: partygames, status: :ok
    end

    def show 
        partygame = @party_game
        render json: partygame, include:  ['users', 'party_games', 'party_games.game', 'party_games_games.trackers', 'party_games_games.helpmes', 'party_game_game.helpmes.comments'], status: :ok
    end

    def create 
        user = @current_user
        party_game = user.party_game.create(party_game_params)
        partygame_user = user.partygame_user.find_by(party_game_id: party_game.id)
        partygame_user.isAdmin = true
        partygame_user.save
        
        render json: party_game, include:  ['users', 'party_games', 'party_games.game', 'party_games_games.trackers', 'party_games_games.helpmes', 'party_game_game.helpmes.comments'], status: :created

    end

    def destroy 
        @party_game.destroy
        head :no_content
    end

    def update 
        party_game = PartyGame.find(params[:id])
        party_game.update(party_game_params)

        #check if admin is changed
        admin_party-game_user = party_game.party_game_users.find {|user| user.isAdmin == true }
        admin_id = admin_party_game_user.user_id

        if params[:admin_id] != admin_id
            admin_party_game_user.update(isAdmin: false)
            new_admin_party_game_user = party_game.party_game_users.find_by(user_id: params[:admin_id])
            new_admin_party_game_user.update(isAdmin: true)
        end


        
        # delete users if needed
        if !params[:delete_users].empty?
            users = params[:delete_users].each do |user_id|
                party_game_user = party_game.party_game_games.find_by(user_id: user_id)
                party_game_user.destroy
            end
        end

        # add users if needed
        if !params[:add_users].empty?
            params[:add_users].each do |user_id|
                party_game.party_game_users.create(user_id: user_id, isAdmin: false)
            end
        end

        render json: party_game, include: ['users', 'party_games', 'party_games.game', 'party_games_games.trackers', 'party_games_games.helpmes', 'party_game_game.helpmes.comments'], status: :accepted
    end


    def current_game
        party_game = PartyGame.find(params[:id])
        new_current_game = party_game.party_game_game.find(params[:new_party_game_game_id])
        old_current_game = party_game.party_game_game.find_by(current: true)

        if old_current_game
            old_current_game.update(current: false, archived: true)
        end

        new_current_game.update(current: true)
        
        render json: party_game, include: ['users', 'party_games', 'party_games.game', 'party_games_games.trackers', 'party_games_games.helpmes', 'party_game_game.helpmes.comments'], status: :accepted
    end

    private 

    def party_game_params
        params.permit(:name)
    end

    def set_party_game 
        @party_game = PartyGame.find(params[:id])
    end

    def render_not_found_response
        render json: { error: 'Game Party Not Found' }, status: :not_found
    end


end

end
