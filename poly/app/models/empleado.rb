class Empleado < ApplicationRecord
    has_many :imagens, as: :foto
end
