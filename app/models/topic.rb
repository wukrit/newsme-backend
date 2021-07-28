class Topic < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :articles
  has_many :news_sources, through: :articles

  def self.list
    ['Business', 'Entertainment', 'Health', 'Science', 'Sports', 'Technology', 'General']
  end

  def self.run_daily
    list.each do |category|
      new_articles = 0
      Topic.create(title: category) if !Topic.pluck(:title).include?(category)

      topic = Topic.find_by(title: category)

      Article.get_top_headlines(category.downcase).each do |article|
        next if article.id != nil

        NewsSource.create(name: article.name) if !NewsSource.pluck(:name).include?(article.name)
        Article.creator(article, topic).valid? ? new_articles += 1 : nil
      end

      puts "#{new_articles} New Articles Added in #{category}"
      topic.summarize(4)
    end
  end

  def summarize(num)
    i = 0
    self.articles.each do |article|
      break if i == num

      article.summarize ? i += 1 : nil
    end
    puts "#{i} / #{self.articles.count} Articles Summarized"
  end

  def serve
    self.articles.select do |article|
      article.body != nil && article.date == Date.yesterday.to_s
    end
  end
end
