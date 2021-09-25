class Ninja < ApplicationRecord
  belongs_to :dojo

  # name y city
  validates :first_name, :last_name, presence: true
end
