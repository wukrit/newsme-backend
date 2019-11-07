<<<<<<< HEAD
<<<<<<< HEAD:app/models/source.rb
class Source < ApplicationRecord
<<<<<<< HEAD
  has_many :filters
  has_many :articles
  has_many :topics, through: :articles
  has_many :users, through: :filters
=======
=======
class NewsSource < ApplicationRecord
>>>>>>> daa9ce2... Rebuilt migrations to account for reserved words:app/models/news_source.rb
=======
class NewsSource < ApplicationRecord
>>>>>>> development
    has_many :filters
    has_many :users, through: :filters
    has_many :articles
    has_many :topics, through: :articles
<<<<<<< HEAD
>>>>>>> 41855c2... Created relationships
=======
>>>>>>> development
end
