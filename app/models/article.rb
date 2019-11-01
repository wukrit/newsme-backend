class Article < ApplicationRecord
    belongs_to :topic
    belongs_to :news_source

    require 'news-api'

  def self.get_top_headlines(category)
    newsapi = News.new(ENV['news_api_key'])
    top_headlines =
      newsapi.get_top_headlines(
        category: category, language: 'en', country: 'us'
      )
  end

end
