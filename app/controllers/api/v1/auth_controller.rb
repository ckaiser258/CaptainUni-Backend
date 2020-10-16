class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        #Find the user based on the passed in username
        @user = User.find_by(username: user_login_params[:username])

        #If user is not nil,
        #authenticate the password with BCrypt, create a session and issue a token
        if @user && @user.authenticate(user_login_params[:password])
            token = issue_token(@user)
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else
            render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password)
    end
end
