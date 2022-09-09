class Animal < ApplicationRecord
    validates :name, :sci_name, presence: true
end
