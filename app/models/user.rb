class User < ApplicationRecord
    has_secure_password
    has_many :purchases, :dependent => :destroy
    has_many :items, through: :purchases
    validates  :username, uniqueness: { case_sensitive: false}
end
