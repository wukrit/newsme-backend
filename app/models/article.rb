class Article < ApplicationRecord
<<<<<<< HEAD
  belongs_to :topic
  belongs_to :source

  require 'news-api'

  def self.get_top_headlines(category)
    newsapi = News.new(ENV['news_api_key'])
    top_headlines =
      newsapi.get_top_headlines(
        category: category, language: 'en', country: 'us'
      )
  end
=======
    belongs_to :topic
<<<<<<< HEAD
    belongs_to :source
>>>>>>> 41855c2... Created relationships
=======
    belongs_to :news_source
>>>>>>> daa9ce2... Rebuilt migrations to account for reserved words
end
