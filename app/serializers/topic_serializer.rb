class TopicSerializer < ActiveModel::Serializer
  attributes :id,:name, :user_id
end
