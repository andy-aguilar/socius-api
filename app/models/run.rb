class Run < ApplicationRecord
    has_many :club_runs
    has_many :user_runs
    has_many :clubs, through: :club_runs
    has_many :users, through: :user_runs
end
