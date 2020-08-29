class RunsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        runs = Run.all
        render json: runs, include: [:users]
    end
end
