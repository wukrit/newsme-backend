# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ['business', 'entertainment', 'health', 'science', 'sports', 'technology', 'general']

categories.each do |category|
    if !Topic.pluck(:title).include?(titlecase(category))
        Topic.create(title: titlecase(category))
    end
    topic = Topic.find_by(title: titlecase(category))
    json = Article.get_top_headlines(category)
    json.each do |article|
        if article.id != nil && !NewsSource.pluck(:name).include?(article.name)
            Source.create(name: article.name)
            Article.creator(article, topic)
        elsif article.id != nil
            Article.creator(article, topic)
        end
    end
end
