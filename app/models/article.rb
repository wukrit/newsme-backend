class Article < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
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
<<<<<<< HEAD
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

<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 27f5bf6... added headline helper
=======
  def self.summarize(url)
=======
  def summarize
>>>>>>> 9972055... Added serve method for topic instances
=======

  def summarize
>>>>>>> development
    text_api_key= Rails.application.credentials.text_api_key
    text_api_id= Rails.application.credentials.text_api_id
    textapi = AylienTextApi::Client.new(
      app_id: text_api_id,
      app_key: text_api_key
    )
    if self.date === Date.today.to_s
      result = textapi.summarize url: self.url, sentences_number: 5
      if result[:sentences].count > 2
        self.update(body: result[:sentences].join(" "))
        return true
      else
        puts "Could not summarize properly from #{self.url}"
        return false
      end
    else
      return false
    end
  end

<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> c820d22... bundled
=======
=======
>>>>>>> development
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
<<<<<<< HEAD
>>>>>>> e443966... updated seeds file
=======
>>>>>>> development
end
