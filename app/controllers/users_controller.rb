class UsersController < ApplicationController

    def create
        # if (User.find_by(email: user_params[:email]))
        #     user = User.find_by(email: user_params[:email])
        #     if user && user.authenticate(user_params[:password])
        #         payload = { user_id: user.id }
        #         token = JWT.encode(payload, secret, 'HS256')
        #         render json: {
        #             user: {
        #                 id: user.id,
        #                 name: user.name,
        #                 email: user.email,
        #                 username: user.username
        #             },
        #             token: token
        #         }
        #     end
        # else
        user = User.create(email: user_params[:email], name: user_params[:name], password: user_params[:password])
        if user.valid?
                payload = { user_id: user.id }
                token = JWT.encode(payload, secret, 'HS256')
                params[:subs].each do |sub|
                    topic = Topic.find_by(title: sub[0])
                    if user.subscriptions.pluck(:topic_id).include?(topic.id) && sub[1] == false
                        user.subscriptions.find_by(topic_id: topic.id).destroy
                    elsif !user.subscriptions.pluck(:topic_id).include?(topic.id) && sub[1] == true
                        Subscription.create(user: user, topic: topic)
                    end
                end
                render json: {user: user, token: token}
        else
                render json: {errors: user.errors.full_messages}
        end
        # end
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

    def subscriptions
        token = request.headers["Authorization"]
        if token
            decoded_token = JWT.decode(
                token,
                secret,
                true,
                { algorithm: "HS256"}
            )
            user = User.find(decoded_token[0]["user_id"])
            render json: user.subscriptions
        end
    end

    def edit
        token = request.headers["Authorization"]
        if token
            decoded_token = JWT.decode(
                token,
                secret,
                true,
                { algorithm: "HS256"}
            )
            user = User.find(decoded_token[0]["user_id"])
            name = user.name == user_params[:name] ? user.name : user_params[:name]
            email = user.email == user_params[:email] ? user.email : user_params[:email]
            user.update(name: name, email: email)
            params[:subs].each do |sub|
                topic = Topic.find_by(title: sub[0])
                if user.subscriptions.pluck(:topic_id).include?(topic.id) && sub[1] == false
                    user.subscriptions.find_by(topic_id: topic.id).destroy
                elsif !user.subscriptions.pluck(:topic_id).include?(topic.id) && sub[1] == true
                    Subscription.create(user: user, topic: topic)
                end
            end
            render json: {
                user: {
                    id: user.id,
                    name: user.name,
                    email: user.email,
                    username: user.username
                },
                token: token
            }
        end
    end

    def delete_account
        token = request.headers["Authorization"]
        if token
            decoded_token = JWT.decode(
                token,
                secret,
                true,
                { algorithm: "HS256"}
            )
            user = User.find(decoded_token[0]["user_id"])
            user.destroy
        end
    end

    def check_email
        if User.exists?(email: user_params[:email])
            render json: { available: false}
        else
            render json: { available: true }
        end
    end

private

    def user_params
        params.permit(:username, :email, :name, :password, :subs)
    end

end
