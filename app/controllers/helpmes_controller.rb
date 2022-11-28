class HelpmesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_helpme, only: [:destroy, :show]

    def create 
        party_game_game = PartyGameGame.find(params[:party_game_game_id])
        question = party_game_game.helpme_questions.create(question_params)
        render json: question, status: :created
    end

    def show
        question = @question
        render json: question
    end

    def update 
        question = Helpme.find(params[:id])
        question.update(question_params)
        
        render json: question, status: :accepted
    end

    def destroy 
        @question.destroy 
        head :no_content
    end


    private 

    def question_params 
        params.permit(:question)
    end

    def set_question 
        @question = Helpme.find(params[:id])
    end

    def render_not_found_response
        render json: { error: 'Question Not Found' }, status: :not_found
    end
end
