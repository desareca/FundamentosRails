class Dojo < ApplicationRecord
    before_destroy :destroy_ninja
    # name y city
    validates :name, :city, presence: true
    # state
    validates :state, presence: true, length: { is: 2 }

    has_many :ninjas, :dependent => :destroy

    def destroy_ninja
        Ninja.find_by(dojo: self).destroy
    end
end
