class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validate :passwords_should_match
  validate :password_length
  validate :email_exists

  private

  def passwords_should_match
    if password != password_confirmation
      errors.add(:password, "Passwords don't match!")
    end
  end

  def email_exists
    if User.exists?(email: email)
      errors.add(:email, "Email already exists!")
    end
  end

  def password_length
    if !password.nil? && password.length < 5
      errors.add(:password, "Password is not at least 5 characters long")
    end
  end

  def self.authenticate_with_credentials (email, password)
    email = email.downcase.strip
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    end
  end

end
