class Category < ApplicationRecord
    has_many :items
    belongs_to :user
    has_many :versions
end
