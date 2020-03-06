class Cart < ApplicationRecord
    belongs_to :user
    has_many :orders

    validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
