class User < ApplicationRecord
<<<<<<< HEAD
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
=======
    has_many :subscriptions, dependent: :destroy
    has_many :topics, through: :subscriptions
    has_many :filters, dependent: :destroy
    has_many :news_sources, through: :filters
<<<<<<< HEAD
>>>>>>> daa9ce2... Rebuilt migrations to account for reserved words
=======

    has_secure_password

    # validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
>>>>>>> 9ff699b... added secure password created login controller
end
