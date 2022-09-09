class Sighting < ApplicationRecord
    validates :animal_id, :longitude, :latitude, :date, presence: true
    belongs_to :animal
end
