class Topic < ApplicationRecord
<<<<<<< HEAD
  has_many :subscriptions
  has_many :articles
  has_many :users, through: :subscriptions
  has_many :sources, through: :articles
=======
    has_many :subscriptions
    has_many :users, through: :subscriptions
    has_many :articles
<<<<<<< HEAD
    has_many :sources, through: :articles
>>>>>>> 41855c2... Created relationships
=======
    has_many :news_sources, through: :articles
>>>>>>> daa9ce2... Rebuilt migrations to account for reserved words
end
