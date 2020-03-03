class Plant < ApplicationRecord
    belongs_to :user
    belongs_to :order
    has_many :comments
    # has_many :categories
end
