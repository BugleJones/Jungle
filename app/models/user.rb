class User < ActiveRecord::Base
    
    # attr_accessor :first_name, :last_name, :email, :password, :password_confirmation

    has_secure_password

    validates :email, :uniqueness => { :case_sensitive => false }
    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true, length: { minimum: 6 }

    validates :first_name, presence: true
    validates :last_name, presence: true

    # before_save { self.email = email.downcase }

    has_many :reviews

    def self.authenticate_with_credentials(email, password)
        user = where('LOWER(email) = ?', email.downcase.strip)[0]
        user && user.authenticate(password)
    end

end
