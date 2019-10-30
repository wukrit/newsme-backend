class AddForeignKeysToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :topics, index: true, foreign_key: true
    add_reference :articles, :sources, index: true, foreign_key: true
  end
end
