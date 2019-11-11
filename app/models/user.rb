class User < ApplicationRecord
    has_many :subscriptions, dependent: :destroy
    has_many :topics, through: :subscriptions
    has_many :filters, dependent: :destroy
    has_many :news_sources, through: :filters

    has_secure_password

    # validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    def serve
        feed = {}
        self.topics.each do |topic|
            feed["#{topic.title}"] = topic.serve
        end
        feed
    end

    def send_newsletter
        UserMailer.with(user: self).newsletter.deliver_now
    end

    def self.send_newsletters
        User.all.each do |user|
            UserMailer.with(user: user).newsletter.deliver_now
        end
    end
end
