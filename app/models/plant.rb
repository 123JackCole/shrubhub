class Plant < ApplicationRecord
    belongs_to :user
    belongs_to :order, optional: true
    has_many :comments
    # has_many :categories
end
