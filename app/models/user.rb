class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, length: { minimum: 8 }
  validates_confirmation_of :password
  validates :email, uniqueness: { case_sensitive: false }

  def authenticate_with_credentials(email, password) 
    email = User.find_by_email(email)
    if email && email.authenticate(password)
      puts "TRUE!!!!!!!"
      true  
    else
      puts "FALSE!!!!!!!!"
      false
    end
end


Define a new class method authenticate_with_credentials on the User model.
It will take as arguments: the email address and password the user typed into the login form,
And return: an instance of the user (if successfully authenticated), or nil (otherwise).
Use it in your Sessions controller, as in the example below:
