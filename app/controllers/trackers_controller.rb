class TrackersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_tracker, only: [:destroy, :show]

    def create 
        party_game_game = PartyGameGame.find(params[:party_game_game_id])
        tracker = party_game_game.trackers.create(tracker_params)

        render json: tracker, status: :created
    end

    def show
        tracker = @tracker
        render json: @tracker
    end

    def update 
        tracker = Tracker.find(params[:id])
        tracker.update(tracker_params)
        
        render json: tracker, status: :accepted
    end

    def destroy 
        @tracker.destroy 
        head :no_content
    end


    private 

    def tracker_params 
        params.permit(:id, :notes, :complete)
    end

    def set_tracker 
        @tracker = Tracker.find(params[:id])
    end

    def render_not_found_response
        render json: { error: 'Tracker Not Found' }, status: :not_found
    end
end

