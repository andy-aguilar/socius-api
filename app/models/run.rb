class Run < ApplicationRecord
    has_one :club
    has_many :user_runs
    has_many :users, through: :user_runs

    scope :future_run, -> { where("date >= ?", Date.today) }
end
