class Message
  include ActiveModel::Model

  attr_accessor :name, :email, :content

  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX }
  validates :content, presence: true, length: { maximum: 1000 }
end
