class Comment < ApplicationRecord
  belongs_to :user
  validate :body, presence: true, length: {maximum: 140}
end
