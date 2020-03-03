class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment
  has_one :concert
  has_one :user
end
