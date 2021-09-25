class Autor < ApplicationRecord
    has_many :cancions, dependent: :destroy
end
