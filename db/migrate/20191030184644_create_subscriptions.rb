class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions, &:timestamps
  end
end
