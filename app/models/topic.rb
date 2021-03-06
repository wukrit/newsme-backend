class Topic < ApplicationRecord
    has_many :subscriptions
    has_many :users, through: :subscriptions
    has_many :articles
    has_many :news_sources, through: :articles

    def self.list
        ['Business', 'Entertainment', 'Health', 'Science', 'Sports', 'Technology', 'General']
    end

    def self.run_daily
        categories = self.list
        categories.each do |category|
            new_articles = 0
            if !Topic.pluck(:title).include?(category)
                Topic.create(title: category)
            end
            topic = Topic.find_by(title: category)
            json = Article.get_top_headlines(category.downcase)
            json.each do |article|
                if article.id != nil && !NewsSource.pluck(:name).include?(article.name)
                    NewsSource.create(name: article.name)
                    Article.creator(article, topic).valid? ? new_articles += 1 : nil
                elsif article.id != nil && NewsSource.pluck(:name).include?(article.name)
                    Article.creator(article, topic).valid? ? new_articles += 1 : nil
                end
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
