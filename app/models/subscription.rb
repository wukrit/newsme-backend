class Subscription < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
  belongs_to :user, dependent: :destroy
  belongs_to :topic, dependent: :destroy
=======
    belongs_to :user, dependent: :destroy
    belongs_to :topic, dependent: :destroy
>>>>>>> 41855c2... Created relationships
=======
    belongs_to :user
    belongs_to :topic
>>>>>>> daa9ce2... Rebuilt migrations to account for reserved words
end
