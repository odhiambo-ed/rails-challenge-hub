class Api::V1::SolutionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :set_challenge
    before_action :set_solution, only: [:show, :update, :destroy]
    
    def index
        @solutions = @challenge.solutions.includes(:user, :votes)
        render json: @solutions
    end
    
    def create
        @solution = @challenge.solutions.build(solution_params)
        @solution.user = current_user
        
        if @solution.save
        render json: @solution, status: :created
        else
        render json: { errors: @solution.errors }, status: :unprocessable_entity
        end
    end
    
    private
    
    def set_challenge
        @challenge = Challenge.find(params[:challenge_id])
    end
    
    def set_solution
        @solution = @challenge.solutions.find(params[:id])
    end
    
    def solution_params
        params.require(:solution).permit(:code, :explanation)
    end
end
