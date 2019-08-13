class User < ApplicationRecord
    before_save { self.email = email.downcase }

    # Upload Picture with Active storage
    has_one_attached :picture

    # set Secure Password
    has_secure_password

    # Validation Email with REGEX
    validates :email, presence: {messages:'Email cannot be blank!'},
    format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
    uniqueness: { case_sensitive: false }

    # Validation Name 
    validates :username, presence: {messages: 'Name cannot be blank!'}

    # Validation Password
    validates :password, presence: true, 
    length: { minimum: 5, messages: " Password Minimum 5 Character!"},
    allow_nil: true
end
