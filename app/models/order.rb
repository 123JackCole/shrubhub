class Order < ApplicationRecord
    belongs_to :user
    has_many :plants

    # validates :_, presence: true
end
