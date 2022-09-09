class Animal < ApplicationRecord
    validates :name, :sci_name, presence: true
    has_many :sightings
end
