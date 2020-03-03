class Concert < ApplicationRecord
  validates :name, :city, presence: true

  has_many :comments, dependent: :destroy
end
