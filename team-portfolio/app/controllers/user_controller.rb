class UserController < ApplicationController
    def new
        @user = User.new
    end
      
    def create
        @user = User.new(user_params)
        if @user.save
            sign_in(@user)
            redirect_to signup_success_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
