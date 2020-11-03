class Version < ApplicationRecord
    has_many :items
    has_many :categories
    belongs_to :user
end