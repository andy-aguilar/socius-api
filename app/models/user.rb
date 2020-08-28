class User < ApplicationRecord
    has_many :user_clubs
    has_many :user_runs
    has_many :clubs, through: :user_clubs
    has_many :runs, through: :user_runs
    validates :email_address, uniqueness: { case_sensitive: false }
    has_secure_password

    
end
