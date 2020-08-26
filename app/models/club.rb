class Club < ApplicationRecord
    has_many :club_runs
    has_many :user_clubs
    has_many :clubs, through: :club_runs
    has_many :users, through: :user_clubs
end
