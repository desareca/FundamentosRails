class Producto < ApplicationRecord
    has_many :imagens, as: :foto
end
