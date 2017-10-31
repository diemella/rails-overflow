class User < ApplicationRecord

  # before_save { email.downcase! }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true
                    # uniqueness: { case_sensitive: false },
                    # format: { with: VALID_EMAIL_REGEX }
  validates :name, :password, :email, presence: true

  has_many :questions

  has_secure_password
end
