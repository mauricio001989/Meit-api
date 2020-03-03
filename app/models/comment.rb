class Comment < ApplicationRecord
  validates :comment, presence: true

  belongs_to :concert
  belongs_to :user
end
