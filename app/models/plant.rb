class Plant < ApplicationRecord
    belongs_to :user
    has_many :orders, optional: true
    has_many :comments
    # has_many :categories

    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :light_instructions, presence: true
    validates :water_instructions, presence: true

end
