# class UserMailer < ApplicationMailer
#    default from: 'notifications@example.com'
#
#    def welcome_email
#        mail(to: 'wlkrwilletts@gmail.com', subject:
#            'Test email from rails')
#    end 
#
#
# end
class UserMailer < Devise::Mailer
    # Allows use of all helpers within 'application_helper'
    helper :application 

    default template_path: 'devise/mailer'

end 