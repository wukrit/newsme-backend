class AddDateColumnToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :date, :string
  end
end
