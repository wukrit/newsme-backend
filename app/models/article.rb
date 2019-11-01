class Article < ApplicationRecord
<<<<<<< HEAD
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
<<<<<<< HEAD
>>>>>>> daa9ce2... Rebuilt migrations to account for reserved words
=======
=======
  belongs_to :topic
  belongs_to :news_source
>>>>>>> c820d22... bundled

  require 'news-api'
  require 'aylien_text_api'

  def self.get_top_headlines(category)
    news_api_key= Rails.application.credentials.news_api_key
    newsapi = News.new(news_api_key)
    top_headlines =
      newsapi.get_top_headlines(
        category: category, language: 'en', country: 'us'
      )
  end

<<<<<<< HEAD
>>>>>>> 27f5bf6... added headline helper
=======
  def self.summarize(url)
    text_api_key= Rails.application.credentials.text_api_key
    text_api_id= Rails.application.credentials.text_api_id
    textapi = AylienTextApi::Client.new(
      app_id: text_api_id, app_key: text_api_key
    )
    result = textapi.summarize url: url, sentences_number: 5
    result[:sentences]
  end

>>>>>>> c820d22... bundled
end
