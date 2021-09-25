class Owner < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  has_many :comments, as: :comm
end
