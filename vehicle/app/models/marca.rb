class Marca < ApplicationRecord
    has_many :compradors, dependent: :destroy
end
