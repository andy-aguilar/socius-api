class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :friend_id, :userObj

  def userObj
    return UserSerializer.new(object.user)
  end

end
