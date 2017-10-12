class UserMailer < ApplicationMailer

    default from: 'no-reply@jungle.com'

    def order_email(order, email)
        @order = order
        @email = email
        mail(to: 'spencerjhamilton@gmail.com', subject: 'Thank you for your recent purchase!')
    end
end