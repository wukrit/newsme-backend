class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
            payload = { user_id: user.id }
            token = JWT.encode(payload, secret, 'HS256')
            render json: {user: user, token: token}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

private

    def user_params
        params.permit(:username, :email, :name, :password)
    end

end
