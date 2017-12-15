class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :comments

  validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email)
    # if email corresponds to a valid user, return that user
   	User.find_by(email: email)
  end
end
