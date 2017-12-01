class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable 


  # Email Validation 
  validates :email, format: {
    with: /\A((.*)(@duke.edu(\s*)))\z/,
    message: "Must be an @duke.edu email"
  }, presence: true

  # First Name Validation (Allows hyphens)
  validates :first_name, format: {
    with: /\A(([^\d\W]*)|(([^\d\W]*)-([^\d\W]*)))\z/,
    message: "must be composed only of alphabetical characters."
  }, presence: true

  # Last Name Validation (Allows hyphens)
  validates :first_name, format: {
    with: /\A(([^\d\W]*)|(([^\d\W]*)-([^\d\W]*)))\z/,
    message: "must be composed only of alphabetical characters."
  }, presence: true

  # Phone Number Validation
  validates :phone, format: {
    with: /\A(\d{3}-\d{3}-\d{4})\z/,
    message: "Phone number must be of the form: 123-456-5555"
  }, presence: true

end
