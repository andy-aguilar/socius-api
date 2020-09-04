class User < ApplicationRecord
    has_many :user_clubs
    has_many :user_runs
    has_many :clubs, through: :user_clubs
    has_many :runs, through: :user_runs
    validates :email_address, uniqueness: { case_sensitive: false }
    has_many :friendships
    has_many :friends, :through => :friendships


    has_many :friend_requests_sent, ->{where(status: false)}, class_name: 'Friendship'
    #returns a collection, where status = false and user_id=user.id
    has_many :requests_sent, through: :friend_requests_sent, source: :friend

    has_many :friend_requests_received, ->{where(status: false)}, class_name: 'Friendship', foreign_key: 'friend_id'
    #returns a collection, where status = false and friend_id = user.id
    has_many :requests_received, through: :friend_requests_received, source: :user

    has_many :friend_requests_accepted, ->{where(status: true)}, class_name: 'Friendship', foreign_key: 'friend_id'
    #returns a collection, where status = true and friend_id = user.id
    has_many :requests_accepted, through: :friend_requests_accepted, source: :user

    has_many :friend_requests_sent_accepted, ->{where(status: true)}, class_name: 'Friendship'
    #returns a collection, where status = false and user_id=user.id
    has_many :requests_sent_accepted, through: :friend_requests_sent_accepted, source: :friend

    has_secure_password
    searchkick

    
    def all_friends 
        self.requests_accepted + self.requests_sent_accepted
    end


end
