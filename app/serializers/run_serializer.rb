class RunSerializer < ActiveModel::Serializer
  attributes :id, :name, :distance, :date, :complete, :user_owner_id, :users

  def users
    ActiveModel::SerializableResource.new(object.users,  each_serializer: UserSerializer)
  end
end
