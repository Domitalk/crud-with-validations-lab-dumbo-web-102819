class Song < ApplicationRecord
    include ActiveModel::Validations 
    validates_with ReleasedValidator
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false ] }
    validates :artist_name, presence: true
end
