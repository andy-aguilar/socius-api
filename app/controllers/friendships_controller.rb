class FriendshipsController < ApplicationController

    def create
        user = User.find_by(id: friendship_params[:user_id])
        friend = User.find_by(id: friendship_params[:friend_id])

        if user.all_friends.include?(friend)
        render json: { error: 'friendship already exists in the database'}, status: :not_acceptable
        else 
        friendship = user.friendships.build(friend_id: friend.id)
            if friendship.save
                render json: { message: 'friendship was successfully created' }, status: :created
            else
                render json: { error: 'friendship could not be saved'}, status: :not_acceptable
            end
        end
    end

    def show
        user = User.find(params[:id])
        sent = user.requests_sent
        received = user.requests_received
        friends = user.all_friends

        if friends
            render json: {sent: sent, friends: friends, received: received }
        else
            render json: {message: "Sorry, you don't have any friends"}
        end
    end

    private

    def friendship_params
        params.require(:friendship).permit(:friend_id, :user_id)
    end

end
