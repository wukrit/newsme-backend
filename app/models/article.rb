class Article < ApplicationRecord
  belongs_to :topic
  belongs_to :news_source

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

  def self.summarize(url)
    text_api_key= Rails.application.credentials.text_api_key
    text_api_id= Rails.application.credentials.text_api_id
    textapi = AylienTextApi::Client.new(
      app_id: text_api_id, app_key: text_api_key
    )
    result = textapi.summarize url: url, sentences_number: 5
    result[:sentences]
  end

end
