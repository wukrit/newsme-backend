class User < ApplicationRecord
<<<<<<< HEAD
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
=======
>>>>>>> development
    has_many :subscriptions, dependent: :destroy
    has_many :topics, through: :subscriptions
    has_many :filters, dependent: :destroy
    has_many :news_sources, through: :filters
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> daa9ce2... Rebuilt migrations to account for reserved words
=======
=======
>>>>>>> development

    has_secure_password

    validates :email, presence: true, uniqueness: true
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 9ff699b... added secure password created login controller
=======
=======
>>>>>>> development

    def serve
        feed = {}
        self.topics.each do |topic|
            feed["#{topic.title}"] = topic.serve
        end
        feed
    end

<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 0dfbceb... added serve feed for users
=======
>>>>>>> development
=======
    def send_newsletter
        UserMailer.with(user: self).newsletter.deliver_now
    end

    def self.send_newsletters
        User.all.each do |user|
            UserMailer.with(user: user).newsletter.deliver_now
        end
    end
>>>>>>> deployment
end
