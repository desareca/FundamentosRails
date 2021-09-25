class Blog < ApplicationRecord
    has_many :owner
    has_many :user, through: :owner

    has_many :post
    has_many :user, through: :post

    has_many :comments, as: :comm

    validates :name, presence: true
end
