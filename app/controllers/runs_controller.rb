class RunsController < ApplicationController

    def index
        runs = Run.all
        render json: runs, include: [:users]
    end

    def create
        # run_params[:time] = DateTime.strptime(run_params[:time], '%Y-%m-%dT%H:%M')
        # byebug
        user = User.find_by(id: run_params[:user_id])

        if user
            run = Run.create(name: run_params[:name], date: run_params[:date], distance: run_params[:distance])
            run.users << user
            render json: run, include: [:users]
        else
            render json: { error: 'failed to create run'}, status: :not_acceptable
        end     
    end

    

    private

    def run_params
        params.require(:run).permit(:name, :date, :distance, :user_id)
    end
end
