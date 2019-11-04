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

    def feed
        token = request.headers["Authorization"]
        if token
            decoded_token = JWT.decode(
                token,
                secret,
                true,
                { algorithm: "HS256"}
            )
            user = User.find(decoded_token[0]["user_id"])
            if user
                render json: user.serve
            else
                render json: { errors: "Invalid Auth Token" }
            end
        else
            render json: { errors: "No Auth token" }
        end
    end

private

    def user_params
        params.permit(:username, :email, :name, :password)
    end

end
