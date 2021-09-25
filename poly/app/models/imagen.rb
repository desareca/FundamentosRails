class Imagen < ApplicationRecord
  belongs_to :foto, polymorphic: true
end
