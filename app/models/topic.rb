class Topic < ApplicationRecord
    has_many :subscriptions
    has_many :users, through: :subscriptions
    has_many :articles
    has_many :news_sources, through: :articles
end
