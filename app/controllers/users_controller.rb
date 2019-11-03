class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
            render json: {user: user, token: encode_token(user)}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

private

    def user_params
        params.permit(:username, :email, :name, :password)
    end

end
