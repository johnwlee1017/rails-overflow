class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(login_info = {})
    user = User.find_by(email: login_info[:email])
    if user && (user.password == login_info[:password])
      user
    else
      nil
    end
  end
end
