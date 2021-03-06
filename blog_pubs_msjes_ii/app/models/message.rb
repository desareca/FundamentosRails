class Message < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_many :comments, as: :comm

  validates :author, presence: true
end
