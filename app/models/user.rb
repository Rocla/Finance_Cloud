class User < ActiveRecord::Base
  has_many :articles

  has_secure_password
  before_save {self.email = email.downcase}

  validates :username,
            presence: true,
            length: {minimum: 3, maximum: 15},
            uniqueness: {case_sensitive: false}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: {minimum: 3, maximum: 100},
            uniqueness: {case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }

  validates :rank,
            numericality: { less_than_or_equal_to: 999 }
end
