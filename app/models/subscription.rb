class Subscription < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :topic, dependent: :destroy
end
