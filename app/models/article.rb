class Article < ApplicationRecord
    belongs_to :topic
    belongs_to :news_source
end
