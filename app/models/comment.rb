class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :body, presence: true, length: {maximum: 140}
end
