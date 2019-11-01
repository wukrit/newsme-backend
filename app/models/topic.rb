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
    has_many :sources, through: :articles
>>>>>>> 41855c2... Created relationships
end
