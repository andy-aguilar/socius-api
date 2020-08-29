class RunSerializer < ActiveModel::Serializer
  attributes :id, :name, :distance, :complete, :users

  def users
    ActiveModel::SerializableResource.new(object.users,  each_serializer: UserSerializer)
  end
end
