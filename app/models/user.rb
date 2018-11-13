class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, length: { minimum: 8 }
  validates_confirmation_of :password
  validates :email, uniqueness: { case_sensitive: false }, format: { without: /\s/ }

  def self.authenticate_with_credentials(email, password) 
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
