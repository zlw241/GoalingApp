require 'bcrypt'


class User < ActiveRecord::Base
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
