class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: true, length: { minimum: 3 }

  validates :email, uniqueness: { case_sensitive: false } 
  
  before_save { self.email.downcase! }

  has_many :reviews

  validate :password_matches_with_confirmation, :password_minimum_length

  validates :rating, presence: false

  def password_matches_with_confirmation
    if self.password != self.password_confirmation
      errors.add(:password, "have to match")
    end
  end

  def password_minimum_length
    if self.password.length < 3 && self.password_confirmation.length < 3
      errors.add(:password, "length should be > 3")
    end
  end

  def User.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
    # If user's login doesn't work, send them back to the login form.
      return nil
    end
  end
end
