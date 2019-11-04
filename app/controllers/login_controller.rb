class LoginController < ApplicationController

    def login
        user = User.find_by(email: user_params[:email])
        if user && user.authenticate(user_params[:password])
            payload = { user_id: user.id }
            token = JWT.encode(payload, secret, 'HS256')
            render json: {
                user: {
                    id: user.id,
                    name: user.name,
                    email: user.email,
                    username: user.username
                },
                token: token
            }
        else
            render json: { errors: "that didn't match any users" }
        end
    end

    def persist
        token = request.headers["Authorization"]
        if token
            decoded_token = JWT.decode(
                token,
                secret,
                true,
                { algorithm: "HS256"}
            )
            user = User.find(decoded_token[0]["user_id"])
            render json: {
                user: {
                    id: user.id,
                    name: user.name,
                    email: user.email,
                    username: user.username
                },
                token: token
            }
        else
            render json: { errors: "No Auth token" }
        end
    end

    private

    def user_params
        params.permit(:username, :email, :password)
    end

end
