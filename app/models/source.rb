class Source < ApplicationRecord
  has_many :filters
  has_many :articles
  has_many :topics, through: :articles
  has_many :users, through: :filters
end
