class Club < ApplicationRecord
    has_many :runs
    has_many :user_clubs
    has_many :users, through: :user_clubs
end
