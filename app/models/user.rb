require 'bcrypt'

class User < ActiveRecord::Base

    has_secure_password

    def create
        @user = User.new(params[:user])
        @user.password = params[:password]

end
