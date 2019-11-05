class NewsSourcesController < ApplicationController

  def index
    news_sources = NewsSources.all
    render json: news_sources
  end

end
