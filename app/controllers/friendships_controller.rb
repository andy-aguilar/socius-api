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
        friends = user.all_friends

        if friends
            render json: {sent: sent, friends: friends}
        else
            render json: {message: "Sorry, you don't have any friends"}
        end
    end

    def update
        friendship = Friendship.find(params[:id])

        if friendship.update(friendship_params)
            render json: { message: "Friend Added"}
        else
            render json: { error: "That didn't work"}
        end
    end

    def requests
        user = User.find(params[:id])
        requests = user.friend_requests_received

        render json: requests
    end

    def destroy
        friendship = Friendship.find(params[:id])

        if friendship.destroy
            render json: { message: "Friendship declined/destroyed"}
        else
            render json: { error: "Couldn't destroy that friend"}
        end
    end

    private

    def friendship_params
        params.require(:friendship).permit(:friend_id, :user_id, :status)
    end

end
