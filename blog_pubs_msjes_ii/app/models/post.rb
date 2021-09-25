class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  has_many :message
  # has_many :user, through: :message

  has_many :comments, as: :comm

  validates :title, presence: true
end
