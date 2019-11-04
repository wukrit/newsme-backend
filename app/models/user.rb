class User < ApplicationRecord
    has_many :subscriptions, dependent: :destroy
    has_many :topics, through: :subscriptions
    has_many :filters, dependent: :destroy
    has_many :news_sources, through: :filters

    has_secure_password

    # validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    def serve_feed
        feed = {}
        self.topics.each do |topic|
            feed[:topic.name] = topic.serve
        end
        feed
    end

end
