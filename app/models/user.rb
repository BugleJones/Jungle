class User < ActiveRecord::Base

    has_secure_password

    def user_logged_in?
        
    end

end
