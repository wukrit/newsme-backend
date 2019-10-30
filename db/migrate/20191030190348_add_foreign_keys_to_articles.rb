class AddForeignKeysToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :topic, index: true, foreign_key: true
    add_reference :articles, :source, index: true, foreign_key: true
  end
end
