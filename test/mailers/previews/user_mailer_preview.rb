
# PATH: 3000/rails/mailers/user_mailer

class UserMailerPreview < ActionMailer::Preview
    def order_email
        UserMailer.order_email(Order.last, email = 'test@test.com')
    end
end