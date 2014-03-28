class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
 # VALID_PASSWD_REGEX = /\A[\w]+[\d]+[a-z]]/
  validates :password, presence: true, length: {minimum:6}
   #        format: { with: VALID_PASSWD_REGEX },
    #       uniqueness: { case_sensitive: false }
end
