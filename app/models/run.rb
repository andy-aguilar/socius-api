class Run < ApplicationRecord
    belongs_to :club
    has_many :user_runs
    has_many :users, through: :user_runs
end
