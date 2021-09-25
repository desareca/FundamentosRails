class Comment < ApplicationRecord
  belongs_to :comm, polymorphic: true
end
