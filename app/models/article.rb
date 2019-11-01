class Article < ApplicationRecord
  belongs_to :topic
  belongs_to :news_source

  require 'news-api'
  require 'aylien_text_api'

  def self.get_top_headlines(category)
    newsapi = News.new(ENV['news_api_key'])
    top_headlines =
      newsapi.get_top_headlines(
        category: category, language: 'en', country: 'us'
      )
  end

  def self.summarize(url)
    textapi = AylienTextApi::Client.new(
      app_id: ENV['text_api_id'], app_key: ENV['text_api_key']
    )
    # byebug
    result = textapi.summarize url: url, sentences_number: 5
    result
  end

end
