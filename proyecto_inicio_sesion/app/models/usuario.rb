class Usuario < ApplicationRecord
    # first_name y last_name
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }

    # email_address
    # EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    # validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :email_address, presence: true

    # age
    validates :age, presence: true
    validates_numericality_of :age, less_than: 150
    validates_numericality_of :age, greater_than: 10
end
