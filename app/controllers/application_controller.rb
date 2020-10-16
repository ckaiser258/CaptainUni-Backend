class ApplicationController < ActionController::API

    #Call the authorized method before any actions in 
    #controllers inheriting from ApplicationController
    before_action :authorized

    SECRET_KEY = ENV['jwt_secret_key']

    def issue_token(user)
        JWT.encode({user_id: user.id, greeting: "030920"}, SECRET_KEY)
    end

    def current_user
        @user ||= User.find_by(id: user_id)
    end

    def token
        request.headers['Authorization']
    end

    def decoded_token
        begin
            JWT.decode(token, SECRET_KEY, true, {:algorithm => 'HS256'})
        rescue JWT::DecodeError
            [{error: "Invalid Token"}]
        end
    end

    def user_id
        decoded_token.first['user_id']
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
    end
end
