class TopicsController < ApplicationController

    def serve
        topic = Topic.find_by(title: params[:topic].titleize)
        # byebug
        if topic
            render json: {articles: topic.serve}
        else
            render json: {errors: "Invalid Request"}
        end
    end

    private

    def topic_params
        params.permit(:username, :topic)
    end
end
