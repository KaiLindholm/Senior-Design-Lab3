class User < ActiveRecord::Base
    has_secure_password

    validates :name, presence: true, length: {maximum: 25}
    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: {with: VALID_EMAIL}, uniqueness: {case_sensitive: false}
    validates :password, presence: true, length: {minimum: 6}
    validates :password_confirmation, presence: true
    
    has_many :comments
end
