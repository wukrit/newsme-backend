class User < ApplicationRecord
<<<<<<< HEAD
  has_many :filters, dependent: :delete_all
  has_many :subscriptions, dependent: :delete_all
  has_many :topics, through: :subscriptions
  has_many :sources, through: :filters

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
=======
    has_many :subscriptions
    has_many :topics, through: :subscriptions
    has_many :filters
    has_many :sources, through: :filters
>>>>>>> 41855c2... Created relationships
end
