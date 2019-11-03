class Article < ApplicationRecord
  belongs_to :topic
  belongs_to :news_source

  validates :headline, presence: true, uniqueness: true

  require 'news-api'
  require 'aylien_text_api'
  require 'date'

  def self.get_top_headlines(category)
    news_api_key= Rails.application.credentials.news_api_key
    newsapi = News.new(news_api_key)
    top_headlines =
      newsapi.get_top_headlines(
        category: category,
        language: 'en',
        country: 'us'
      )
  end

  def summarize
    text_api_key= Rails.application.credentials.text_api_key
    text_api_id= Rails.application.credentials.text_api_id
    textapi = AylienTextApi::Client.new(
      app_id: text_api_id,
      app_key: text_api_key
    )
    result = textapi.summarize url: self.url, sentences_number: 5
    if result[:sentences].count > 2
      self.update(body: result[:sentences].join(" "))
      return true
    else
      puts "Could not summarize properly from #{self.url}"
      return false
    end
  end

  def self.get_date(article_obj)
    date = Date.parse(article_obj.publishedAt)
    date.to_s
  end

  def self.creator(article_obj, topic)
    str_date = Article.get_date(article_obj)
    Article.create(
        headline: article_obj.title,
        url: article_obj.url,
        date: str_date,
        news_source: NewsSource.find_by(name: article_obj.name),
        topic: topic
    )
  end
end
