class Order < ApplicationRecord
    belongs_to :cart
    belongs_to :plant

    validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
