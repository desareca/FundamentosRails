class Post < ApplicationRecord
  belongs_to :blog
  before_destroy :destroy_msg

  validates :title, presence: true, length: { minimum: 7}
  validates :content, presence: true

  has_many :messages, :dependent => :destroy
end

def destroy_msg
  if Message.find_by(post: self)==nil
    true
  else
    Message.find_by(post: self).destroy
  end
end
