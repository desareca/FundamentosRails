class User < ApplicationRecord
    has_many :owner
    has_many :blog, through: :owner

    has_many :post
    has_many :blog, through: :post

    has_many :message

    has_many :comments, as: :comm
    
    validates :first_name, :last_name, presence: true
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
