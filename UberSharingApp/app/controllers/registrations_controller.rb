class RegistrationsController < Devise::RegistrationsController

    private 

    def sign_up_params
        params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :unconfirmed_email)
    end 

    def account_update_params
        params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :current_password, :unconfirmed_email)
    end 

end 