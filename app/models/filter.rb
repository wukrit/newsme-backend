class Filter < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :source
end
