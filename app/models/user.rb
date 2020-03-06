class User < ApplicationRecord
    has_one :cart
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, {presence: true, on: :create}
end
