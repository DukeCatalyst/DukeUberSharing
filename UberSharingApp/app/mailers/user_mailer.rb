class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email
        mail(to: 'wlkrwilletts@gmail.com', subject: 'Test email from rails')
    end 


end
