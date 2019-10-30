class Topic < ApplicationRecord
  has_many :subscriptions
  has_many :articles
  has_many :users, through: :subscriptions
  has_many :sources, through: :articles
end
