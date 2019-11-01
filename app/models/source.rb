class Source < ApplicationRecord
<<<<<<< HEAD
  has_many :filters
  has_many :articles
  has_many :topics, through: :articles
  has_many :users, through: :filters
=======
    has_many :filters
    has_many :users, through: :filters
    has_many :articles
    has_many :topics, through: :articles
>>>>>>> 41855c2... Created relationships
end
