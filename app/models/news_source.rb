class NewsSource < ApplicationRecord
    has_many :filters
    has_many :users, through: :filters
    has_many :articles
    has_many :topics, through: :articles
end
