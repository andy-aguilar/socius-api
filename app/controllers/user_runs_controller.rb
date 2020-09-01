class UserRunsController < ApplicationController

    def create
        user = User.find(user_run_params[:user_id])
        run = Run.find(user_run_params[:run_id])
        if run.users.include?(user)
            byebug
            render json: { error: "You've already joined #{run.name}!"}
        else
            byebug
            user_run = UserRun.create(user_run_params)
            render json: run, include: [:users]
        end
        
    end

    private

    def user_run_params
        params.require(:user_run).permit(:user_id, :run_id)
    end
end
