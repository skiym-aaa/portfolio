class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validate :body, presence: true, length: {maximum: 140}
end
