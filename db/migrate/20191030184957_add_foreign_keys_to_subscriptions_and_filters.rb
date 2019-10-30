class AddForeignKeysToSubscriptionsAndFilters < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :users, index: true, foreign_key: true
    add_reference :subscriptions, :topics, index: true, foreign_key: true
    add_reference :filters, :users, index: true, foreign_key: true
    add_reference :filters, :sources, index: true, foreign_key: true
  end
end
