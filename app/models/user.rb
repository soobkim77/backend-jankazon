class User < ApplicationRecord
    has_secure_password
    has_many :purchases, :dependent => :destroy
    has_many :items, through: :purchases, :dependent => :destroy
    validates  :username, uniqueness: { case_sensitive: false}
end
