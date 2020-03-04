class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :plant

    validates :name, presence: true
    validates :content, presence: true
end
