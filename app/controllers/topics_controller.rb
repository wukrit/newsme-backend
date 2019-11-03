class TopicsController < ApplicationController

    def serve
        topic = Topic.find_by(title: params[:topic])
        render json: {articles: topic.serve}
    end

    private

    def topic_params
        params.permit(:username, :topic)
    end
end
