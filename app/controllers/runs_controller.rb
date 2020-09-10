class RunsController < ApplicationController

    def index
        runs = Run.all
        render json: runs, include: [:users]
    end

    def show
        run = Run.find(params[:id])
        render json: run
    end

    def create
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
        runs = Run.where(user_owner_id: user.id).where('date >= ?', Date.today).order(:date).limit(5)
        render json: runs, include: [:users]
    end

    def user_history
        user = User.find(params[:id])
        runs = Run.where(user_owner_id: user.id).where('date < ?', Date.today).order(date: :desc)
        render json: runs, include: [:users]
    end

    def user_friend_runs
        user = User.find(params[:id])
        friend_ids = user.all_friend_ids
        runs = Run.future_run.where(user_owner_id: user.all_friend_ids).order(:date).limit(3).offset(params[:offset])
        render json: runs, include: [:users]
    end

    def filtered_runs
        user = User.find(params[:id])
        runs = Run.where(user_owner_id: user.all_friend_ids).where(date: filter_params[:min_date]..filter_params[:max_date]).where('date::time BETWEEN ? AND ?', filter_params[:min_time], filter_params[:max_time]).where(distance: filter_params[:min_distance]..filter_params[:max_distance]).order(:date)
        if runs.length > 0
            render json: runs, include: [:users]
        else
            render json: {message: "Sorry, there are no runs that match your filter criteria"}
        end
    end

    def leave
        user = User.find(params[:user])
        run = Run.find(params[:run])

        if user && run
            run.users.delete(user)
            render json: run, include: [:users]
        else
            render json: { errror: "failed to delete"}
        end
    end

    def run_stats
        user = User.find(params[:user])
        
        future_runs = user.runs.where("date >= ?", Date.today).length()
        past_runs = user.runs.where("date < ?", Date.today).length()
        future_planned_runs = Run.where(user_owner_id: user.id).where('date >= ?', Date.today).length()
        future_joined_runs = Run.where('user_owner_id != ?', user.id).where('date >= ?', Date.today).length()
        created_runs = Run.where(user_owner_id: user.id).length()
        all_runs = user.runs.length()
        friends = user.all_friend_ids.length()

        render json: {future_runs: future_runs, past_runs: past_runs, future_planned_runs: future_planned_runs, created_runs: created_runs, all_runs: all_runs, friends: friends, future_joined_runs: future_joined_runs  }

    end

    def update
        run =  Run.find(params[:id])

        if run.update(run_params)
            render json: run, include: [:users]
        else
            render json: { error: "couldn't update that run."}
        end
    end

    private

    def run_params
        params.require(:run).permit(:name, :date, :distance, :user_owner_id, :latitude, :longitude, :zoom)
    end

    def filter_params
        params.require(:filter).permit(:min_date, :max_date, :min_time, :max_time, :min_distance, :max_distance)
    end
end



