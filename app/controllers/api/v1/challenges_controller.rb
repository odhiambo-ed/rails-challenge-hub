class Api::V1::ChallengesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :set_challenge, only: [:show, :update, :destroy]
    
    def index
        @challenges = Challenge.includes(:tags, :user)
                            .order(created_at: :desc)
                            .page(params[:page])
        render json: @challenges
    end
    
    def show
        render json: @challenge, include: ['solutions', 'solutions.user']
    end
    
    def create
        @challenge = current_user.challenges.build(challenge_params)
        if @challenge.save
        render json: @challenge, status: :created
        else
        render json: { errors: @challenge.errors }, status: :unprocessable_entity
        end
    end
    
    private
    
    def set_challenge
        @challenge = Challenge.find(params[:id])
    end
    
    def challenge_params
        params.require(:challenge).permit(:title, :description, :difficulty_level, tag_ids: [])
    end
end
