class AddForeignKeysToSubscriptionsAndFilters < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :user, index: true, foreign_key: true
    add_reference :subscriptions, :topic, index: true, foreign_key: true
    add_reference :filters, :user, index: true, foreign_key: true
    add_reference :filters, :news_source, index: true, foreign_key: true
  end
end
