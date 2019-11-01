class Subscription < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user, dependent: :destroy
  belongs_to :topic, dependent: :destroy
=======
    belongs_to :user, dependent: :destroy
    belongs_to :topic, dependent: :destroy
>>>>>>> 41855c2... Created relationships
end
