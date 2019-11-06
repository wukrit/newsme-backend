class Filter < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
  belongs_to :user, dependent: :destroy
  belongs_to :source, dependent: :destroy
=======
    belongs_to :user, dependent: :destroy
    belongs_to :source, dependent: :destroy
>>>>>>> 41855c2... Created relationships
=======
    belongs_to :user
    belongs_to :news_source
>>>>>>> daa9ce2... Rebuilt migrations to account for reserved words
end
