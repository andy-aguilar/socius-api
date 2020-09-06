class RunsController < ApplicationController

    def index
        runs = Run.all
        render json: runs, include: [:users]
    end

    def create
        # run_params[:time] = DateTime.strptime(run_params[:time], '%Y-%m-%dT%H:%M')
        user = User.find_by(id: run_params[:user_owner_id])

        if user
            run = Run.create(run_params)
            
            run.users << user
            render json: run, include: [:users]
        else
            render json: { error: 'failed to create run'}, status: :not_acceptable
        end     
    end

    def user_runs
        user = User.find(params[:id])
        runs = Run.where(user_owner_id: user.id)
        render json: runs, include: [:users]
    end

    def user_friend_runs
        user = User.find(params[:id])
        friend_ids = user.all_friend_ids
        runs = Run.where(user_owner_id: user.all_friend_ids)
        render json: runs, include: [:users]
    end

    private

    def run_params
        params.require(:run).permit(:name, :date, :distance, :user_owner_id, :latitude, :longitude, :zoom)
    end
end
